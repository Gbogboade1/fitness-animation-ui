/// Reference device configuration
class ScaleConfig {
  const ScaleConfig({
    this.width = 390,
    this.height = 844,
    this.allowFontScaling = false,
  });

  /// Reference width of device. Defaults to 414px (iPhone XS Max)
  final double width;

  /// Reference height of device. Defaults to 896px (iPhone XS Max)
  final double height;

  /// Should allow automatic scaling of font sizes. Defaults to true
  final bool allowFontScaling;

  @override
  // ignore: no_runtimetype_tostring
  String toString() => '$runtimeType($width, $height, $allowFontScaling)';
}
