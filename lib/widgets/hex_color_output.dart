import 'package:flutter/material.dart';

class HexColorOutput extends StatefulWidget {
  const HexColorOutput({
    Key? key,
    required this.stream,
  }) : super(key: key);
  final Stream<String> stream;

  @override
  State<HexColorOutput> createState() => _HexColorOutputState();
}

class _HexColorOutputState extends State<HexColorOutput> {
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
