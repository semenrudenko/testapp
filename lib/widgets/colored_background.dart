import 'package:flutter/material.dart';

class ColoredBackground extends StatefulWidget {
  const ColoredBackground({
    Key? key,
    required this.stream,
    this.child,
    this.callback,
  }) : super(key: key);
  final Function()? callback;
  final Stream<Color?> stream;
  final Widget? child;

  @override
  State<ColoredBackground> createState() => _ColoredBackgroundState();
}

class _ColoredBackgroundState extends State<ColoredBackground> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.callback,
      child: StreamBuilder<Color?>(
        stream: widget.stream,
        builder: (context, snapshot) => Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(24),
            color: snapshot.data ?? Colors.black,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
