part of bloom.widgets;

class BloomTextTheme {
  static final BloomTextTheme darkContent = _getDarkContent();

  final TextStyle baseStyle;
  final TextStyle windowTitle;

  const BloomTextTheme({
    @required this.baseStyle,
    @required this.windowTitle,
  });
}

BloomTextTheme _getDarkContent() {
  final baseStyle = TextStyle(
    fontFamily: "Inter",
    fontSize: 14,
    height: (14 + 8) / 14,
    color: Colors.black87,
  );

  return BloomTextTheme(
    baseStyle: baseStyle,
    windowTitle: baseStyle.copyWith(
      fontSize: 16,
      height: (16 + 8) / 16,
      fontWeight: FontWeight.w600,
    ),
  );
}

class BloomTheme {
  static BloomTheme of(BuildContext context, [bool watch = true]) =>
      watch ? context.watch<BloomTheme>() : context.read<BloomTheme>();

  static final BloomTheme darkContent = BloomTheme(
    textTheme: BloomTextTheme.darkContent,
    background: Colors.white,
    dividerColor: Colors.black.withOpacity(0.1),
    hoverColor: Colors.black.withOpacity(0.05),
  );

  final BloomTextTheme textTheme;

  final Color background;
  final Color dividerColor;
  final Color hoverColor;

  const BloomTheme({
    @required this.textTheme,
    @required this.background,
    @required this.dividerColor,
    @required this.hoverColor,
  });
}
