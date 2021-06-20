import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_mdbdc5l7.json',
                controller: _controller, onLoaded: (composition) {
              _controller.duration = composition.duration;
            }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    _controller.reverse();
                  },
                  icon: Icon(Icons.arrow_left),
                ),
                IconButton(
                  onPressed: () {
                    _controller.stop();
                  },
                  icon: Icon(Icons.pause),
                ),
                IconButton(
                  onPressed: () {
                    _controller.forward();
                  },
                  icon: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
