part of bloom.widgets;

class BloomScaffold extends StatelessWidget {
  final BloomAppBar appBar;
  final Widget child;

  BloomScaffold({
    Key key,
    @required this.appBar,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BloomTheme.of(context);
    final innerContent = Column(
      children: [
        appBar,
        Expanded(
          child: child,
        )
      ],
    );

    return Container(
      color: theme.background,
      child: innerContent,
    );
  }
}
