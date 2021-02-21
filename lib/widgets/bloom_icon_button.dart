part of bloom.widgets;

class BloomIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  final bool tiny;

  BloomIconButton({
    Key key,
    @required this.icon,
    @required this.onTap,
    this.tiny: false,
  }) : super(key: key);

  @override
  _BloomIconButtonState createState() => _BloomIconButtonState();
}

class _BloomIconButtonState extends State<BloomIconButton>
    with SingleTickerProviderStateMixin {
  static const _kSize = 24.0;
  static const _kTinySize = 16.0;

  static const _kPadding = 8.0;
  static const _kTinyPadding = 4.0;

  static const _kBorderRadius = BorderRadius.all(Radius.circular(8.0));
  static const _kAnimDuration = Duration(milliseconds: 100);

  AnimationController controller;
  Animation<Color> animation;

  @override
  void initState() {
    super.initState();

    final theme = BloomTheme.of(context, false);

    controller = AnimationController(
      duration: _kAnimDuration,
      vsync: this,
    );

    animation = ColorTween(
      begin: theme.hoverColor.withOpacity(0),
      end: theme.hoverColor,
    ).animate(controller);

    animation.addListener(() => setState(_noOp));
  }

  _onEnter(_) {
    controller.forward();
  }

  _onExit(_) {
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final theme = BloomTheme.of(context);
    final tiny = widget.tiny;

    final container = Container(
      padding: EdgeInsets.all(!tiny ? _kPadding : _kTinyPadding),
      decoration: BoxDecoration(
        color: animation.value,
        borderRadius: _kBorderRadius,
      ),
      child: Icon(
        widget.icon,
        size: !tiny ? _kSize : _kTinySize,
        color: theme.textTheme.baseStyle.color,
      ),
    );

    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: GestureDetector(
        onTap: widget.onTap,
        child: container,
      ),
    );
  }
}
