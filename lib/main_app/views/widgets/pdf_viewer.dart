import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/my_health/models/view_document_model.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';


class PdfFileViewerScreen extends StatefulWidget {
  File file;
  PdfFileViewerScreen(this.file);
  @override
  _PdfFileViewerScreenState createState() => _PdfFileViewerScreenState();
}

class _PdfFileViewerScreenState extends State<PdfFileViewerScreen> {

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




/////////////////////////
//////////////////////////




class PdfbyteViewerScreen extends StatefulWidget {

  String attachmentUrl;
  String attachmentName;
  PdfbyteViewerScreen(this.attachmentUrl,this.attachmentName);
  @override
  _PdfbyteViewerScreenState createState() => _PdfbyteViewerScreenState();
}

class _PdfbyteViewerScreenState extends State<PdfbyteViewerScreen> {

  Uint8List byteArray;
  Future<String> fetchDocFile(String filePath) async{
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'text/plain'
      };
      var request = http.Request('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/file-by-name'));
      request.body =json.encode({"attachmentPath" : filePath});
      print("Fillleeee:::: $filePath");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();


      print('resssskj ${response.statusCode}');
      if (response.statusCode == 200) {
        var body=await response.stream.bytesToString();
        ViewDocumentModel data = viewDocumentModelFromJson(body) ;
        String obj=data.obj;
        print('fileOBJ::::: $obj');
        return obj;

      }
      else {
        print(response.reasonPhrase);
      }

    } on Exception catch (e) {
      // TODO
      print("PDFDATAERROR");
      print(e.toString());
      return null;
    }
    return null;
  }



  Future<Uint8List> _createPdfFileFrombase(String filePath) async {
    String docFilee= await fetchDocFile(filePath);
    Uint8List bytes = base64.decode(docFilee);
    // print('objjjjj:::: $bytes');
    // newFile= File.fromRawPath(bytes);
    // print('objjjjjbb:::: $newFile');
    return bytes;
  }
  @override
  void initState() {
    // TODO: implement initState
    _createPdfFileFrombase(widget.attachmentUrl).then((value){
      byteArray=value;
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name=widget.attachmentName;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(name),
      ),
      body:byteArray==null?Loader(): Padding(
        padding: const EdgeInsets.all(8.0),
        child: PDFView(
         // filePath: widget.file.path,
          pdfData: byteArray,
        ),
      ),
    );
  }
}

/////////
///////////////////

class ImagebyteViewerScreen extends StatefulWidget {

  String attachmentUrl;
  String attachmentName;
  ImagebyteViewerScreen(this.attachmentUrl,this.attachmentName);
  @override
  _ImagebyteViewerScreenState createState() => _ImagebyteViewerScreenState();
}

class _ImagebyteViewerScreenState extends State<ImagebyteViewerScreen> {

  Image byteArray;
  Future<String> fetchDocFile(String filePath) async{
    var accessToken=await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    try {
      var headers = {
        'Authorization': 'Bearer $accessToken',
        'Content-Type': 'text/plain'
      };
      var request = http.Request('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/file-by-name'));
      request.body =json.encode({"attachmentPath" : filePath});
      print("Fillleeee:::: $filePath");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();


      print('resssskj ${response.statusCode}');
      if (response.statusCode == 200) {
        var body=await response.stream.bytesToString();
        ViewDocumentModel data = viewDocumentModelFromJson(body) ;
        String obj=data.obj;
        print('fileOBJ::::: $obj');
        return obj;

      }
      else {
        print(response.reasonPhrase);
      }

    } on Exception catch (e) {
      // TODO
      print("PDFDATAERROR");
      print(e.toString());
      return null;
    }
    return null;
  }



  Future<Image> _createPdfFileFrombase(String filePath) async {
    String docFilee= await fetchDocFile(filePath);
    Uint8List bytes = base64.decode(docFilee);
    // print('objjjjj:::: $bytes');
    // newFile= File.fromRawPath(bytes);
    // print('objjjjjbb:::: $newFile');
   Image _loadImage= Image.memory(bytes);
    return _loadImage;
  }
  @override
  void initState() {
    // TODO: implement initState
    _createPdfFileFrombase(widget.attachmentUrl).then((value){
      byteArray=value;
      setState(() {

      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final name=widget.attachmentName;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(name),
      ),
      body:byteArray==null?Loader(): Center(
        child: Container(
          child: byteArray,
          // PhotoView(
          //   // filePath: widget.file.path,
          //   imageProvider: byteArray,
          // ),
        ),
      ),
    );
  }
}
