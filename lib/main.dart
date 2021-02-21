import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:bloom/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BloomApp(
      title: 'Flutter Demo',
      theme: BloomTheme.darkContent,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BloomScaffold(
      appBar: BloomAppBar(
        title: Text(widget.title),
        actions: [
          BloomIconButton(
            icon: Icons.add,
            onTap: _incrementCounter,
          )
        ],
        elevation: BloomElevation.none,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter'),
          ],
        ),
      ),
    );
  }
}
