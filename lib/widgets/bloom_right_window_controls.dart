part of bloom.widgets;

class BloomRightWindowControls extends StatelessWidget {
  static const _kHeight = 64.0;
  static const _kSpacing = EdgeInsets.only(left: 16.0);

  @override
  Widget build(BuildContext context) {
    final theme = BloomTheme.of(context);
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        theme.dividerColor.withOpacity(0),
        theme.dividerColor,
        theme.dividerColor.withOpacity(0),
      ],
    );

    return Row(
      children: [
        Container(
          height: _kHeight,
          width: 1,
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          margin: EdgeInsets.only(left: 8.0,),
        ),
        BloomIconButton(
          icon: Icons.ios_share,
          onTap: () {},
          tiny: true,
        ).padding(_kSpacing),
        BloomIconButton(
          icon: Icons.close,
          onTap: () {},
          tiny: true,
        ).padding(_kSpacing),
      ],
    );
  }
}
