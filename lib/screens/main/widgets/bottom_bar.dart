import 'package:TodoApp/blocs/category/category_bloc.dart';
import 'package:TodoApp/models/category.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  final buttonTextStyle = TextStyle(
    color: CustomTheme.textColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: addTaskBtn(),
          ),
          SizedBox(width: 10),
          Material(
            color: Colors.transparent,
            shape: CircleBorder(),
            clipBehavior: Clip.antiAlias,
            child: Ink(
              decoration: ShapeDecoration(
                color: CustomTheme.color1,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.list),
                color: Colors.white,
                onPressed: () {
                  openBottomSheet(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget addTaskBtn() {
    return _OpenContainerWrapper(
      onClosed: (data) {},
      transitionType: ContainerTransitionType.fade,
      closedBuilder: (context, VoidCallback action) {
        return MaterialButton(
          onPressed: action,
          color: Colors.grey[100],
          shape: StadiumBorder(),
          padding: EdgeInsets.only(left: 18, top: 15, bottom: 15),
          child: Row(
            children: [
              Text(
                'Agregar Nueva Tarea',
                style: buttonTextStyle,
              )
            ],
          ),
        );
      },
    );
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        child: Wrap(
          children: [
            ListTile(
              title: Text('Ordenar por'),
              subtitle: Text('Mi Orden'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Crear nueva categoría'),
              onTap: () => openModal(context),
            ),
            Divider(),
            ListTile(
              title: Text('Tema'),
              subtitle: Text('Claro'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void openModal(BuildContext context) {
    TextEditingController txController = new TextEditingController();

    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Crear Categoria'),
        content: Wrap(
          children: [
            TextFormField(
              controller: txController,
              decoration: InputDecoration(
                hintText: 'Ingresa el título de la categoría',
              ),
              validator: (value) =>
                  value.length < 3 ? 'Nombre demasiado corto' : null,
            ),
          ],
        ),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
            textColor: Colors.grey,
          ),
          FlatButton(
            onPressed: () {
              if (txController.text.isNotEmpty) {
                context.read<CategoryBloc>().add(CategoryAdd(
                      category: new Category(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: txController.text,
                      ),
                    ));
                Navigator.of(context).pop();
              }
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}

class _OpenContainerWrapper extends StatelessWidget {
  const _OpenContainerWrapper({
    this.closedBuilder,
    this.transitionType,
    this.onClosed,
  });

  final OpenContainerBuilder closedBuilder;
  final ContainerTransitionType transitionType;
  final ClosedCallback<bool> onClosed;

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: transitionType,
      openBuilder: (BuildContext context, VoidCallback _) {
        return const NewTaskScreen();
      },
      onClosed: onClosed,
      tappable: false,
      closedElevation: 0,
      closedShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      closedColor: Colors.white,
      closedBuilder: closedBuilder,
    );
  }
}

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
