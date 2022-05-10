import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class pdfGen {
  void genrator() async {
    var pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.all(10),
        build: (pw.Context context) {
          return pw.Container(height: 100, width: 200, color: PdfColors.green);
        },
      ),
    );


    Directory directory = await getApplicationDocumentsDirectory();
    File file = File("${directory.path}/f1.pdf");
    await file.writeAsBytes(await pdf.save());
  }
}
