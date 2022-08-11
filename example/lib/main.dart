import 'package:animated_dashed_circle/animated_dashed_circle.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Animated Dashed Circle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AnimatedDashedCircle().show(
              image: const AssetImage("assets/user.jpg"),
              autoPlay: true,
              contentPadding: 0,
              duration: const Duration(seconds: 5),
              height: 250,
              borderWidth: 5,
            ),
            TextButton(
              onPressed: () => AnimatedDashedCircle().stopCircle(),
              child: const Text("Stop Circle"),
            ),
            TextButton(
              onPressed: () => AnimatedDashedCircle().playCircle(),
              child: const Text("Play Circle"),
            ),
            TextButton(
              onPressed: () => AnimatedDashedCircle().playCircle(type: AnimatedionDashedCircleType.repeat),
              child: const Text("Play Circle Auto Repeat"),
            )
          ],
        ),
      ),
    );
  }
}
