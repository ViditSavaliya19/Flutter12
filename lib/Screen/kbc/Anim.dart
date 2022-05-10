import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool i = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              setState(() {
                i = true;
              });
            },
            icon: Icon(Icons.add),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  i = false;
                });
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 200,
                alignment: Alignment.center,
                color: Colors.blue.shade50,
                child: Text("Hello Flutter"),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 2),
                bottom: i?100:00,
                child: Container(
                  height: 100,
                  width: 200,
                  alignment: Alignment.center,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
