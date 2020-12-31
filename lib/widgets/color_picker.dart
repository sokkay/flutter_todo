import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  ColorPicker({
    Key key,
    this.onChangeColor,
  }) : super(key: key);

  final ValueChanged<Color> onChangeColor;

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<Color> colors = [
    Colors.grey,
    Colors.yellow,
    Colors.pink,
    Colors.amber,
    Colors.blue,
    Colors.brown,
    Colors.cyan,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.indigo,
    Colors.purple,
  ];

  Color _selected;
  List<BoxBorder> _border;

  @override
  void initState() {
    resetBorders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: colors
          .map((e) => GestureDetector(
                onTap: () => handleTap(e),
                child: AnimatedContainer(
                  height: 32,
                  width: 32,
                  margin: const EdgeInsets.only(right: 15, bottom: 8),
                  decoration: BoxDecoration(
                    color: e,
                    border: _border[colors.indexOf(e)],
                    shape: BoxShape.circle,
                  ),
                  duration: Duration(milliseconds: 300),
                  child: _border[colors.indexOf(e)] != null
                      ? Icon(Icons.check, color: Colors.black26)
                      : null,
                ),
              ))
          .toList(),
    );
  }

  void handleTap(Color color) {
    resetBorders();
    _border.insert(
      colors.indexOf(color),
      _selected != color
          ? Border.all(
              color: Colors.black26,
              width: 1,
            )
          : null,
    );

    if (widget.onChangeColor != null) {
      widget.onChangeColor(color);
    }
    setState(() {});
  }

  void resetBorders() => _border = colors.map<BoxBorder>((e) => null).toList();
}
