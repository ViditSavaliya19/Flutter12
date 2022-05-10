import 'package:flutter/material.dart';
import 'dart:io';

class MyApps extends StatelessWidget {

  String data ="Hello";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$data"),
              ElevatedButton(
                onPressed: () {

                },
                child: Text("Clicked"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
