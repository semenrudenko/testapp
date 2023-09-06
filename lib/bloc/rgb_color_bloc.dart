import 'dart:math';

import 'package:rxdart/rxdart.dart';

class RGBColorBloc {
  RGBColorBloc();
  final _rgbColorSubject = BehaviorSubject<List<int>>();

  Stream<List<int>> get dataStream => _rgbColorSubject.stream;

  void generateNewColor() {
    int red = Random().nextInt(256);
    int green = Random().nextInt(256);
    int blue = Random().nextInt(256);
    _rgbColorSubject.add([red, green, blue]);
  }

  void dispose() {
    _rgbColorSubject.close();
  }
}
