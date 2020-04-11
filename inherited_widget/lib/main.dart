import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
      data: this,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: IncrementBody(),
        floatingActionButton:
            IncrementButton(), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class IncrementBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '${InheritedCounter.of(context).data.counter}',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: InheritedCounter.of(context).data.incrementCounter,
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}

class InheritedCounter extends InheritedWidget {
  const InheritedCounter({
    Key key,
    @required this.data,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final _MyHomePageState data;

  static InheritedCounter of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(InheritedCounter);

  @override
  bool updateShouldNotify(InheritedCounter old) => data.counter != old.data.counter;
}
