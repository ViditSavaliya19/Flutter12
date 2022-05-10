import 'package:flutter/material.dart';
import 'package:untitled12/GPDF.dart';
import 'package:untitled12/pdfGen.dart';

class PDF_Screen extends StatefulWidget {
  const PDF_Screen({Key? key}) : super(key: key);

  @override
  State<PDF_Screen> createState() => _PDF_ScreenState();
}

class _PDF_ScreenState extends State<PDF_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () {
             pdfGen pd= pdfGen();
             pd.genrator();

            },
            child: Text("Save"),
          ),
        ),
      ),
    );
  }
}


