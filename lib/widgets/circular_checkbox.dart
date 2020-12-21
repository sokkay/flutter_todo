import 'package:flutter/material.dart';

class CircularCheckbox extends StatefulWidget {
  final Color color;
  final bool check;
  final ValueChanged<bool> onValueChange;

  CircularCheckbox(
      {Key key, @required this.color, @required this.check, this.onValueChange})
      : super(key: key);

  @override
  _CircularCheckboxState createState() => _CircularCheckboxState();
}

class _CircularCheckboxState extends State<CircularCheckbox> {
  final double sizeIcon = 30.0;

  bool taped;

  @override
  void initState() {
    taped = widget.check;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final iconCheck = Icon(
      Icons.check_circle_outline_rounded,
      color: widget.color,
      size: sizeIcon,
    );
    final iconUnCheck = Container(
      height: sizeIcon,
      width: sizeIcon,
      padding: const EdgeInsets.all(1.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(sizeIcon),
          border: Border.all(color: widget.color, width: 2.5),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        setState(() => taped = !taped);
        widget.onValueChange(taped);
      },
      child: AnimatedCrossFade(
        firstChild: iconCheck,
        secondChild: iconUnCheck,
        crossFadeState:
            taped ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
