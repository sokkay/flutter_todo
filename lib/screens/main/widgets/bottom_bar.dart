import 'package:TodoApp/screens/main/widgets/add_category.dart';
import 'package:TodoApp/screens/task_new/new_task_screen.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

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
      shape: CustomTheme.modalshape,
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
              onTap: () => openAddCategoryModal(context),
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

  void openAddCategoryModal(BuildContext context) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      shape: CustomTheme.modalshape,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        margin: MediaQuery.of(context).viewInsets,
        child: AddCategory(),
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
