import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slivers Demo',
      home: MyHomePage(
        title: 'Flutter Slivers Demo',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> _colors;

  Color randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

  List<Color> _generateColorList() {
    List<Color> colors = [];
    for (var i = 0; i < 15; i++) {
      colors.add(randomColor());
    }
    return colors;
  }

  void tap(Color color) {
    setState(() {
      color = randomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    _colors = _generateColorList();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              for (var i = 0; i < 15; i++)
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: AnimatedContainer(
                    color: _colors[i],
                    duration: Duration(seconds: 2),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      title: Center(
                        child: Text(
                          '${i}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      onTap: () => tap(_colors[i]),
                    ),
                  ),
                ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      centerTitle: true,
      title: Text(widget.title),
      floating: true,
      pinned: false,
      snap: true,
      expandedHeight: 200.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
