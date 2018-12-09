import 'package:boundary/boundary.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'RePaintBoundary RelayoutBoundary'),
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
  String _buttonText = 'test';
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: CustomMultiChildLayout(
              delegate: LayoutBoundaryDelegate(),
              children: <Widget>[
                LayoutId(
                    id: LayoutBoundaryDelegate.title,
                    child: Row(children: <Widget>[
                      Expanded(
                          child: Container(
                        height: 50.0, // add for test relayoutBoundary
                        child: LayoutBoundary(),
                      )),
                      Expanded(
                          child: Text(
                              'You have pushed the button this many times:'))
                    ])),
                LayoutId(
                    id: LayoutBoundaryDelegate.summary,
                    child: Container(
                      width: 200.0,    // add for test relayoutBoundary
                      height: 50.0,    // add for test relayoutBoundary
                      child: InkWell(
                        child: Text(
                          _buttonText,
                          style: Theme.of(context).textTheme.display1,
                        ),
                        onTap: () {
                          setState(() {
                            _index++;
                            _buttonText = 'onTap$_index';
                          });
                        },
                      ),
                    )),
                LayoutId(
                    id: LayoutBoundaryDelegate.paintBoundary,
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      child: RepaintBoundary(  // add for test repaintBoundary
                        child: PaintBoundary(),
                      ),
                    )),
              ]),
        ));
  }
}
