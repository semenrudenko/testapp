extension HexColor on List<int> {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${this[0].toRadixString(16).padLeft(2, '0')}'
      '${this[1].toRadixString(16).padLeft(2, '0')}'
      '${this[2].toRadixString(16).padLeft(2, '0')}';
}
