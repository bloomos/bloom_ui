part of bloom.widgets;

class BloomAppBar extends StatelessWidget {
  static const _kHeight = 64.0;
  static const _kSpacing = 8.0;
  static const _kMargin = EdgeInsets.symmetric(horizontal: 24.0);

  final Widget title;
  final List<Widget> actions;

  final BloomElevation elevation;
  final bool rightWindowControls;

  BloomAppBar({
    Key key,
    @required this.title,
    this.actions: const [],
    this.elevation: BloomElevation.border,
    this.rightWindowControls: true,
  }) : super(key: key);

  Widget _buildRight(BuildContext context) {
    return Row(
      children: [
        ...actions.map(
          (action) => action.padding(
            EdgeInsets.only(left: _kSpacing),
          ),
        ),
        if (rightWindowControls) BloomRightWindowControls(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = BloomTheme.of(context);

    final hasBorder = elevation == BloomElevation.border ||
        elevation == BloomElevation.shadow;

    Widget widget = Container(
      height: _kHeight,
      constraints: BoxConstraints.expand(
        height: _kHeight,
      ),
      padding: _kMargin,
      child: Stack(
        fit: StackFit.expand,
        children: [
          DefaultTextStyle(
            style: theme.textTheme.windowTitle,
            child: title,
          ).center(),
          if (rightWindowControls || actions.length > 0)
            Positioned(
              right: 0,
              child: _buildRight(context),
            ),
        ],
      ),
    );

    if (hasBorder) {
      widget = widget.border(bottom: true);
    }

    return widget;
  }
}
