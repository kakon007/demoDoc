import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';


class PdfViewerScreen extends StatefulWidget {
  File file;
  PdfViewerScreen(this.file);
  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {

  @override
  Widget build(BuildContext context) {
    final name=basename(widget.file.path);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PDFView(
          filePath: widget.file.path,
        ),
      ),
    );
  }
}
