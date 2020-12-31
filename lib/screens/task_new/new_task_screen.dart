import 'package:flutter/material.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.check), onPressed: () {}),
          IconButton(icon: Icon(Icons.delete), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: _Form(),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({
    Key key,
  }) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  FocusNode _detailsFocus;

  final InputDecoration _inputDecoration = new InputDecoration(
    fillColor: Colors.transparent,
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
    ),
  );

  final textStyle = new TextStyle(fontSize: 16, color: Colors.grey[700]);

  @override
  void initState() {
    _detailsFocus = new FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: _inputDecoration.copyWith(hintText: 'Ingresar un título'),
          style: TextStyle(fontSize: 20),
        ),
        ListTile(
          leading: Icon(Icons.notes),
          title: TextField(
            focusNode: _detailsFocus,
            decoration: _inputDecoration.copyWith(
              hintText: 'Agregar detalles',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
            ),
            maxLines: null,
          ),
          dense: true,
          onTap: () => _detailsFocus.requestFocus(),
        ),
        ListTile(
          leading: Icon(Icons.event_available),
          title: Text('Agregar fecha/hora', style: textStyle),
          dense: true,
        ),
        //TODO: deberia ser condicional.
        ListTile(
          leading: Icon(Icons.repeat),
          dense: true,
        )
      ],
    );
  }

  @override
  void dispose() {
    _detailsFocus.dispose();
    super.dispose();
  }
}
