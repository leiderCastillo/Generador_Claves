import 'package:code_generator/theme/theme.dart';
import 'package:flutter/material.dart';

class ListCheck extends StatefulWidget {
  final String text;
  final bool value;
  final void Function(dynamic value) onChanged;

  const ListCheck({
    super.key,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  State<ListCheck> createState() => _ListCheckState();
}

class _ListCheckState extends State<ListCheck> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.value,
          onChanged: widget.onChanged
        ),
        const SizedBox(width: 10,),
        Text(widget.text,style: TextStyle(
          color: ColorsApp.greydark,
        ),
        textScaleFactor: 1.1,)
      ],
    );
  }
}