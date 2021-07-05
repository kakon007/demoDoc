import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/my_health/models/view_document_model.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:photo_view/photo_view.dart';
import 'package:path_provider/path_provider.dart' as pp;
import 'package:file_saver/file_saver.dart';
import 'package:path/path.dart' as path;



class PdfFileViewerScreen extends StatefulWidget {
  File file;
  var fileName;
  PdfFileViewerScreen(this.file,this.fileName);
  @override
  _PdfFileViewerScreenState createState() => _PdfFileViewerScreenState();
}

class _PdfFileViewerScreenState extends State<PdfFileViewerScreen> {
  PDFDocument document;
  bool _isLoading = true;
  loadDocument() async {
    document = await PDFDocument.fromFile(widget.file);
    setState(() => _isLoading = false);
  }
  @override
  void initState() {
    super.initState();
    loadDocument();
  }
  @override
  Widget build(BuildContext context) {
    //final name=basename(widget.file.path);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.fileName),
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            :PDFViewer(
          //filePath: widget.file.path,
          document: document,
          zoomSteps: 1,
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

  File pdfFile;
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



  Future<File> _createPdfFileFrombase(String filePath) async {
    String docFilee= await fetchDocFile(filePath);
    Uint8List bytes = base64.decode(docFilee);
    // var filePathh=await FileSaver.instance.saveFile(path.basenameWithoutExtension(widget.attachmentName), bytes, 'pdf',mimeType: MimeType.PDF);
    // // print('objjjjj:::: $bytes');
    // // newFile= File.fromRawPath(bytes);
    // // print('objjjjjbb:::: $newFile');
    // return filePathh;

    //SVProgressHUD.show(status: 'Opening Pdf');
    String dir = (await pp.getApplicationDocumentsDirectory()).path;
    File file = File(
       path.join( dir , "${widget.attachmentName}"));
    return file.writeAsBytes( bytes, flush: true);
    // print("FILEEEEE" + file.toString());
    // //SVProgressHUD.dismiss();
    //  file;
  }

  PDFDocument document;
  bool _isLoading = true;
  loadDocument() async {
    document = await PDFDocument.fromFile(pdfFile);

    setState(() => _isLoading = false);
    print('Localizeed'+pdfFile.toString());
  }
  @override
  void initState() {
    // TODO: implement initState
    _createPdfFileFrombase(widget.attachmentUrl).then((value){

      if(value!=null){
       pdfFile=value;
       setState(() {
         loadDocument();
       });
      }

      //print('Localize'+pdfFile.toString());
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
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            :PDFViewer(
          //filePath: widget.file.path,
          document: document,
          zoomSteps: 1,
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
