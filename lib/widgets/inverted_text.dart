import 'package:flutter/material.dart';

class InvertedText extends StatelessWidget {
  const InvertedText({Key? key, required this.text, required this.stream})
      : super(key: key);
  final String text;
  final Stream<Color?> stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Color?>(
      stream: stream,
      builder: (context, snapshot) => Text(
        text,
        style: TextStyle(
          color: snapshot.data ?? Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
