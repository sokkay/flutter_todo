import 'package:TodoApp/blocs/category/category_bloc.dart';
import 'package:TodoApp/models/category.dart';
import 'package:TodoApp/theme/custom_theme.dart';
import 'package:TodoApp/widgets/color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCategory extends StatefulWidget {
  AddCategory({Key key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  TextEditingController txController;
  FocusNode _focusNode;

  final inputDecoration = InputDecoration(
    filled: true,
    fillColor: CustomTheme.loginContainerColor,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
    labelText: 'Nombre',
    hintText: 'Ingresa el título de la categoría',
  );

  final titleStyle = TextStyle(color: CustomTheme.color1, fontSize: 18);

  Color _selectedColor;

  @override
  void initState() {
    txController = new TextEditingController();
    _focusNode = new FocusNode();
    _focusNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Crear Categoria',
          style: titleStyle,
        ),
        Divider(),
        TextFormField(
          focusNode: _focusNode,
          controller: txController,
          decoration: inputDecoration,
          validator: (value) =>
              value.length < 3 ? 'Nombre demasiado corto' : null,
          textCapitalization: TextCapitalization.sentences,
        ),
        SizedBox(height: 12),
        Text(
          'Color',
          style: TextStyle(color: CustomTheme.color1, fontSize: 16),
        ),
        SizedBox(height: 12),
        ColorPicker(
          onChangeColor: (color) => setState(() => _selectedColor = color),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancelar'),
              textColor: Colors.grey,
            ),
            FlatButton(
              onPressed: () {
                if (txController.text.isNotEmpty) {
                  context.read<CategoryBloc>().add(
                        CategoryAdd(
                          category: new Category(
                            name: txController.text,
                            color: _selectedColor.value,
                          ),
                        ),
                      );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    txController?.dispose();
    _focusNode?.dispose();
    super.dispose();
  }
}
