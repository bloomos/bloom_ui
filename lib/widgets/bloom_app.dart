part of bloom.widgets;

class BloomApp extends StatelessWidget {
  final String title;
  final BloomTheme theme;
  final Widget home;

  BloomApp({
    Key key,
    @required this.title,
    @required this.theme,
    @required this.home,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: theme,
      child: WidgetsApp(
        title: title,
        color: theme.background,
        textStyle: theme.textTheme.baseStyle,
        pageRouteBuilder: <T>(RouteSettings settings, WidgetBuilder builder) {
          return MaterialPageRoute<T>(settings: settings, builder: builder);
        },
        home: home,
      ),
    );
  }
}
