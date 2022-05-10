import 'dart:math' as math;

import 'package:flutter/material.dart';

class FooPage extends StatefulWidget {
  const FooPage({Key? key}) : super(key: key);

  @override
  State<FooPage> createState() => _FooPageState();
}

class _FooPageState extends State<FooPage> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? colorAnimation;
  Animation? sizeAnimation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.pink, end: Colors.indigo)
        .animate(animationController!);
    sizeAnimation =
        Tween<double>(begin: 100, end: 200).animate(animationController!);
    animationController!.addListener(() {
      setState(() {

      });
    });
    animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(Icons.add),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: sizeAnimation!.value,
          width: sizeAnimation!.value,
          color: colorAnimation!.value,
        ),
      ),
    );
  }
}
