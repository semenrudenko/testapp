import 'package:flutter/material.dart';

class RGBColorOutput extends StatefulWidget {
  const RGBColorOutput({
    Key? key,
    required this.stream,
  }) : super(key: key);
  final Stream<String> stream;

  @override
  State<RGBColorOutput> createState() => _RGBColorOutputState();
}

class _RGBColorOutputState extends State<RGBColorOutput> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: widget.stream,
      builder: (context, snapshot) => Text(
        snapshot.data ?? 'No Data 😢',
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
