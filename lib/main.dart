import 'dart:html';

import 'package:flutter/material.dart';
import 'package:test_app/bloc/rgb_color_bloc.dart';
import 'package:test_app/stream_transform_helpers.dart';
import 'package:test_app/widgets/colored_background.dart';
import 'package:test_app/widgets/hex_color_output.dart';
import 'package:test_app/widgets/inverted_text.dart';
import 'package:test_app/widgets/rgb_color_output.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = RGBColorBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HexColorOutput(
                    stream: _bloc.dataStream.map<String>(rgbListToHexString)),
                RGBColorOutput(
                    stream: _bloc.dataStream.map<String>(rgbListToRGBString))
              ],
            ),
            Expanded(
              child: ColoredBackground(
                callback: () {
                  _bloc.generateNewColor();
                },
                stream: _bloc.dataStream.map<Color?>(rgbListToColor),
                child: Center(
                  child: InvertedText(
                      text: 'Hello there',
                      stream:
                          _bloc.dataStream.map<Color?>(rgbListToInvertedColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
