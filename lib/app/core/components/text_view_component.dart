import 'package:flutter/material.dart';

class TextViewComponent extends StatefulWidget {
  final String text;
  final double padding;
  double? fontSize;
   TextViewComponent({this.fontSize,required this.padding,required this.text,Key? key}) : super(key: key);

  @override
  State<TextViewComponent> createState() => _TextViewComponentState();
}

class _TextViewComponentState extends State<TextViewComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.padding),
      child: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: widget.fontSize ?? 30,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
