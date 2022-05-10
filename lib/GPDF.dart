import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class GPDF {
  void pdfGenrate() async {

    var pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.all(10),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(height: 100, width: 100, color: PdfColors.red);
        },
      ),
    );
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/flutter.pdf');
    await file.writeAsBytes(await pdf.save());
  }
}
