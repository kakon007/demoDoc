import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/my_health/models/prescription_list_model.dart';
import 'package:myhealthbd_app/features/my_health/models/view_document_model.dart';
import 'package:myhealthbd_app/features/my_health/repositories/prescription_repository.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/doc_edit_prompt.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/document_list.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/prescription_list.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/report_list.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/report_screen.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/share_document_widget.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/switch_account.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/switch_account_alert_dialog.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/upload_document_screen.dart';
import 'package:myhealthbd_app/features/my_health/view_model/document_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/prescription_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/report_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/upload_documents_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/view_document_view_model.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:myhealthbd_app/main_app/api_helper/url_launcher_helper.dart';
import 'package:myhealthbd_app/main_app/home.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:myhealthbd_app/main_app/views/widgets/pdf_viewer.dart';
import 'package:open_file/open_file.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as pp;

class PrescriptionListScreen extends StatefulWidget {
  // final Function menuCallBack;
  // bool isDrawerOpen;
  String accessToken;
  PrescriptionListScreen({this.accessToken});
  @override
  _PrescriptionListScreenState createState() => _PrescriptionListScreenState();
}

class _PrescriptionListScreenState extends State<PrescriptionListScreen> {

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }


  TextEditingController _searchTextEditingController = TextEditingController();
  var _searchFieldFocusNode = FocusNode();

  TextEditingController _searchTextEditingController3 = TextEditingController();
  var _searchFieldFocusNode3 = FocusNode();

  List<Datum> dataList2=List<Datum>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //final String assetName2="assets/icons/right.svg";
  final Widget righticon = SvgPicture.asset(
    "assets/icons/right.svg",
    width: 40,
    height: 20,
    fit: BoxFit.fitWidth,
    allowDrawingOutsideViewBox: true,
    matchTextDirection: true,
    //semanticsLabel: 'Acme Logo'
  );

  File newFile;
  bool isLoading=false;

  // void startTimer() {
  //   Timer.periodic(const Duration(seconds: 3), (t) {
  //     setState(() {
  //       isLoading = false; //set loading to false
  //     });
  //     t.cancel();
  //     isLoading=true;//stops the timer
  //   });
  // }

  List<ReportList> reportList = [
    ReportList(
        reportName: 'X-ray report',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        hosName: 'Apollo Hospital Bangladesh'),
    ReportList(
        reportName: 'X-ray report',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        hosName: 'Apollo Hospital Bangladesh'),
    ReportList(
        reportName: 'X-ray report',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        hosName: 'Apollo Hospital Bangladesh'),
    ReportList(
        reportName: 'X-ray report',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        hosName: 'Apollo Hospital Bangladesh'),
    ReportList(
        reportName: 'X-ray report',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        hosName: 'Apollo Hospital Bangladesh'),
    ReportList(
        reportName: 'X-ray report',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        hosName: 'Apollo Hospital Bangladesh'),
    ReportList(
        reportName: 'X-ray report',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        hosName: 'Apollo Hospital Bangladesh'),
    ReportList(
        reportName: 'X-ray report',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        hosName: 'Apollo Hospital Bangladesh'),
  ];

  List<DocumentList> docList=[
    DocumentList(
      fileName: "X-ray report.jpg",
      day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
    ),
    DocumentList(
      fileName: "X-ray report.jpg",
      day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
    ),
    DocumentList(
      fileName: "X-ray report.jpg",
      day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
    )
  ];
  MultiSelectController controller = new MultiSelectController();
  MultiSelectController controller2 = new MultiSelectController();
  MultiSelectController controller3 = new MultiSelectController();

  ScrollController _scrollController = ScrollController();
  //ScrollController _scrollController3 = ScrollController();

  Future<PrescriptionListModel> fetchedData;


  Future fetchPDF(String index) async {
    try {
      print("FETCHPDFDATA");
      print('INDEX'+index);
      var headers = {
        'Authorization': 'Bearer ${widget.accessToken}'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://qa.myhealthbd.com:9096/prescription-service-api/api/report/prescription'));
      request.fields.addAll({
        'prescriptionId': index,
        'pClient': 'aalok',
        'pLayout': '1'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = await response.stream.toBytes();
        print("BODYOFSTRING:::"+body.toString());
        return body;
      }
      else {
        print("ERROROFSTRING::::"+response.reasonPhrase);
        return null;
      }
    } on Exception catch (e) {
      // TODO
      print("PDFDATAERROR");
      print(e.toString());
      return null;
    }

  }

  Future docFile(String filePath) async{
    try {
      var headers = {
        'Authorization': 'Bearer 1052f7a2-ba79-4ed1-bc28-c348372d86af',
        'Content-Type': 'text/plain'
      };
      var request = http.Request('POST', Uri.parse('https://qa.myhealthbd.com:9096/diagnostic-api/api/file-attachment/file-by-name'));
      request.body =json.encode({"attachmentPath" : filePath});
      print("Fillleeee:::: $filePath");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

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
  }

  Future<File> _createPdfFileFromString(String index) async {
    // final encodedStr='''''';
    // Uint8List bytes = base64.decode(encodedStr);
    String dir = (await pp.getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
    await file.writeAsBytes(await fetchPDF(index),flush: true);
    print("FILEEEEE"+file.toString());
    return file;
  }

  Future<File> _createPdfFileFrombase(String filePath) async {
    Uint8List bytes = base64.decode(await docFile(filePath));
    print('objjjjj:::: $bytes');
    newFile= File.fromRawPath(bytes);
    print('objjjjjbb:::: $newFile');
    return newFile;
  }

  // createPdf() async {
  //   var bytes = base64Decode(widget.base64String.replaceAll('\n', ''));
  //   final output = await pp.getTemporaryDirectory();
  //   final file = File("${output.path}/example.pdf");
  //   await file.writeAsBytes(bytes.buffer.asUint8List());
  //
  //   print("${output.path}/example.pdf");
  //   await OpenFile.open("${output.path}/example.pdf");
  //   setState(() {});
  // }

  @override
  void initState() {
    PrescriptionRepository().fetchPrescriptionList(accessToken: widget.accessToken);

    super.initState();
    var vm = Provider.of<PrescriptionListViewModel>(context, listen: false);
    vm.getData(widget.accessToken);
    var vm2 = Provider.of<ReportViewModel>(context, listen: false);
    vm2.getData();
    var vm3 = Provider.of<DocumentViewModel>(context, listen: false);
    vm3.getDataforDoc();
    Future.delayed(Duration.zero, () async {
      await Provider.of<UploadDocumentsViewModel>(context, listen: false).deleteDocuments(accessToken: widget.accessToken);
    });
    // var vm4 = Provider.of<ViewDocumentViewModel>(context, listen: false);
    // vm4.getData();
    //startTimer();
    print("jaaaaahhhhhhiiiiddddddd");
    controller.disableEditingWhenNoneSelected = true;
    controller.set(dataList2.length);
    controller2.set(reportList.length);
    controller3.set(vm3.documentList.length);

    if (vm.isInSearchMode) {
      _searchFieldFocusNode.requestFocus();
    }

    _scrollController.addListener(() {


       if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent-100) {
         print('scrolklinggtatg');
        vm.getMoreData(widget.accessToken);
      }

    });

    // _scrollController3.addListener(() {
    //
    //
    //   if (_scrollController3.position.pixels >=
    //       _scrollController3.position.maxScrollExtent-100) {
    //     print('scrolklinggtatg');
    //     vm3.getMoreData(widget.accessToken);
    //   }
    //
    // });
  }

  void delete() {
    var vm3 = Provider.of<DocumentViewModel>(context,listen: false);
    var list = controller3.selectedIndexes;
    //var list2 = controller2.selectedIndexes;
    list.sort((b, a) =>
        a.compareTo(b)); //reoder from biggest number, so it wont error
    // list2.sort((b, a) => a.compareTo(b));
    list.forEach((element) {

      vm3.documentList.removeAt(element);
      // reportList.removeAt(element);
      // docList.removeAt(element);
    });

    setState(() {
      controller3.set(vm3.documentList.length);
      // controller2.set(reportList.length);
      // controller3.set(docList.length);
    });
  }

  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }



  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<PrescriptionListViewModel>(context,listen: true);
    List<Datum> list = vm.prescriptionList;
    var lengthofPrescriptionList = list.length;
    var vm2= Provider.of<ReportViewModel>(context,listen: true);
    var vm3= Provider.of<DocumentViewModel>(context,listen: true);
    var vm4= Provider.of<ViewDocumentViewModel>(context,listen: true);
    var vm6 = Provider.of<UploadDocumentsViewModel>(context, listen: true);
    print("lltt::: ${vm3.documentList.length}");
    var childButtons = List<UnicornButton>();
    var width = MediaQuery.of(context).size.width * 0.44;
    var height = MediaQuery.of(context).size.height;


    final String assetName4 = "assets/images/dx.svg";
    final String assetName2="assets/icons/right.svg";
    final String assetName7="assets/icons/greyright.svg";
    final String assetName5="assets/icons/pp.svg";
    final String assetName6="assets/icons/jp.svg";
    final String assetName8="assets/icons/upload.svg";
    final String assetName9="assets/icons/cm.svg";

    final Widget dx = SvgPicture.asset(
      assetName4,
      width: 50,
      height: 60,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final Widget righticon = SvgPicture.asset(
      assetName2,
      width: 40,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final Widget greyright = SvgPicture.asset(
      assetName7,
      width: 40,
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final Widget pp = SvgPicture.asset(
      assetName5,
      width: 80,
      height: 100,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final Widget jp = SvgPicture.asset(
      assetName6,
      width: 80,
      height:100,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final Widget uploadIcon = SvgPicture.asset(
      assetName8,
      width: 20,
      height:15,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final Widget cm = SvgPicture.asset(
      assetName9,
      width: 20,
      height:15,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );


    // childButtons.add(UnicornButton(
    //     hasLabel: true,
    //     labelText: "Capture Documents",
    //     labelColor: HexColor("#354291") ,
    //     labelBackgroundColor: HexColor("#E9ECFE"),
    //     labelFontSize: 10,
    //     currentButton: FloatingActionButton(
    //       heroTag: "train",
    //       backgroundColor: HexColor("#354291"),
    //       mini: true,
    //       child: cm,
    //       onPressed: () {},
    //     )));

    void _showAlertDialogForEditMemberList(BuildContext context) {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor:
        Colors.black.withOpacity(0.5),
        transitionDuration:
        Duration(milliseconds: 700),
        context: context,
        pageBuilder:
            (context, anim1, anim2) {
          return Stack(
            children: [
              Align(
                // alignment: Alignment.bottomCenter,
                child: Material(
                  type: MaterialType
                      .transparency,
                  child: Container(
                    height: 200,
                    margin:
                    EdgeInsets.only(
                        left: 15,
                        right: 15),
                    decoration:
                    BoxDecoration(
                      gradient:
                      LinearGradient(
                        begin: Alignment
                            .topCenter,
                        end: Alignment
                            .bottomCenter,
                        colors: [
                          HexColor(
                              '#fdf0f2'),
                          HexColor(
                              '#FFFFFF')
                        ],
                        tileMode: TileMode
                            .repeated,
                      ),
                      borderRadius:
                      BorderRadius
                          .circular(
                          20),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets
                          .only(
                          top: 60.0),
                      child: Center(
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Remove ", style: GoogleFonts.poppins()),
                                    //Text(members[index].name,style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                    Text(" from", style: GoogleFonts.poppins())
                                  ],
                                ),
                                Text("your members list.", style: GoogleFonts.poppins())
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets
                                  .only(
                                  left:
                                  25.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap:
                                        () {
                                      Navigator.pop(context);
                                    },
                                    child:
                                    Material(
                                      elevation:
                                      0,
                                      shape:
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: HexColor('#354291'))),
                                      color:
                                      Colors.white,
                                      child:
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(color: HexColor('#354291'), fontWeight: FontWeight.w500, fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                    15,
                                  ),
                                  GestureDetector(
                                    onTap:
                                        () {
                                    },
                                    child:
                                    Material(
                                      elevation:
                                      0,
                                      shape:
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      color:
                                      HexColor('#354291'),
                                      child:
                                      SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Remove",
                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top:
                MediaQuery.of(context)
                    .size
                    .height /
                    3.35,
                left: 100,
                right: 100,
                child: CircleAvatar(
                  backgroundColor:
                  Colors.transparent,
                  radius: Constants
                      .avatarRadius,
                  child: ClipRRect(
                      borderRadius:
                      BorderRadius.all(
                          Radius.circular(
                              Constants
                                  .avatarRadius)),
                      child: Image.asset(
                          "assets/images/warning.png")),
                ),
              ),
            ],
          );
        },
        transitionBuilder: (context,
            anim1, anim2, child) {
          return SlideTransition(
            position: Tween(
                begin: Offset(0, 2),
                end: Offset(0, 0))
                .animate(anim1),
            child: child,
          );
        },
      );
    }

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: " Upload Documents\n(JPG,PNG,PDF only)",
        labelColor: HexColor("#354291") ,
        labelBackgroundColor: HexColor("#E9ECFE"),
        labelFontSize: 10,
        currentButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, PageTransition(
              type: PageTransitionType.rightToLeft,
              child:UploadDocumentScreen(),
            ),);
          },
            heroTag: "airplane",
            backgroundColor: HexColor("#354291"),
            mini: true,
            child: uploadIcon)));

    void handleClick(String value) {
      switch (value) {
        case 'Share':
          {
            showModalBottomSheet(
                backgroundColor: HexColor("#E9ECFE"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        var index = 0;
                        bool isTrue = false;
                        return FractionallySizedBox(
                            heightFactor: 0.65,
                            child:ShareDocument()
                        );
                      });
                });
          }
          break;
        case 'Download':
          break;

      }
    }

    void handleClickForDocuments(String value) {
      switch (value) {
        case 'Share':
          {
            showModalBottomSheet(
                backgroundColor: HexColor("#E9ECFE"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (BuildContext context, StateSetter setState) {
                        var index = 0;
                        bool isTrue = false;
                        return FractionallySizedBox(
                            heightFactor: 0.65,
                            child:ShareDocument()
                        );
                      });
                });
          }
          break;
        case 'Download':
          break;
        case 'Delete':
          {
           // vm6.deleteDocuments(ssCreatedOn: vm3.documentList)
          }
          break;

      }
    }
    var popup= Padding(
      padding: EdgeInsets.only(bottom: 60,right: 1),
      child: Container(
        //margin: EdgeInsets.only(bottom: 60,),
        width: 25,
        height: 30,
        child: PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Share', 'Download'}.map((String choice) {
              return PopupMenuItem<String>(
                height: 30,
                value: choice,
                child: Text(choice,style:GoogleFonts.poppins(fontSize: 12),),

              );
            }).toList();
          },
        ),
      ),);

    var popup2=
    Padding(
      padding: EdgeInsets.only(bottom: 60,right: 1),
      child: Container(
        //margin: EdgeInsets.only(bottom: 60,),
        width: 28,
        height: 30,
        child: PopupMenuButton<String>(
          onSelected: handleClickForDocuments,
          itemBuilder: (BuildContext context) {
            return {'Share', 'Download', 'Delete'}.map((String choice) {
              return PopupMenuItem<String>(
                height: 30,
                value: choice,
                child: Text(choice,style:GoogleFonts.poppins(fontSize: 12),),

              );
            }).toList();
          },
        ),
      ),);


    final String assetName1 = "assets/images/rx.svg";

    final Widget rx = SvgPicture.asset(
      assetName1,
      width: 50,
      height: 60,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    var cardHeight = MediaQuery.of(context).size.height * 0.1537;
    var cardWidth = MediaQuery.of(context).size.width * 0.3435;
    var spaceBetween = SizedBox(
      height: height >= 600 ? 15.0 : 10.0,
    );
    var searchField=
    Container(
      //height: 40,
        width: 200,
        height: 60,
        child:Padding(
          padding: const EdgeInsets.only(bottom:20.0,right: 12),
          child:
          // Stack(
          //     children:[
                //Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.search_outlined,size: 25,), onPressed: null)),
                TextField(
                  autofocus: false,
                  textInputAction: TextInputAction.search,
                  focusNode: _searchFieldFocusNode,
                  controller: _searchTextEditingController,
                  cursorColor: HexColor('#C5CAE8'),
                  decoration: InputDecoration(
                    hintText: 'Search prescriptions',
                    hintStyle: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w400),
                    //labelText: "Resevior Name",
                    fillColor: Colors.white,
                    focusedBorder:UnderlineInputBorder(
                      borderSide:  BorderSide(color: HexColor('#354291').withOpacity(0.5), width: 1.5),
                      //borderRadius: BorderRadius.circular(25.0),
                    ),
                    suffixIcon:IconButton(
                      icon:Icon(Icons.search_sharp),
                      onPressed: (){
                        vm.search(_searchTextEditingController.text,widget.accessToken);

                      },
                    )
                  ),
                  // onChanged: (text) {
                  //   //value = text;
                  // },
                  onSubmitted: (v){
                    vm.search(_searchTextEditingController.text,widget.accessToken);
                  },

                ),
          //     ]
          // ),
        )
    );

    var searchFieldforDoc=
    Container(
      //height: 40,
        width: 200,
        height: 60,
        child:Padding(
          padding: const EdgeInsets.only(bottom:20.0,right: 12),
          child:
          // Stack(
          //     children:[
          //Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.search_outlined,size: 25,), onPressed: null)),
          TextField(
            autofocus: false,
            textInputAction: TextInputAction.search,
            focusNode: _searchFieldFocusNode3,
            controller: _searchTextEditingController3,
            cursorColor: HexColor('#C5CAE8'),
            decoration: InputDecoration(
                hintText: 'Search prescriptions',
                hintStyle: GoogleFonts.poppins(fontSize: 11,fontWeight: FontWeight.w400),
                //labelText: "Resevior Name",
                fillColor: Colors.white,
                focusedBorder:UnderlineInputBorder(
                  borderSide:  BorderSide(color: HexColor('#354291').withOpacity(0.5), width: 1.5),
                  //borderRadius: BorderRadius.circular(25.0),
                ),
                suffixIcon:IconButton(
                  icon:Icon(Icons.search_sharp),
                  onPressed: (){
                    vm3.search(_searchTextEditingController3.text,widget.accessToken);

                  },
                )
            ),
            // onChanged: (text) {
            //   //value = text;
            // },
            onSubmitted: (v){
              vm3.search(_searchTextEditingController3.text,widget.accessToken);
            },

          ),
          //     ]
          // ),
        )
    );
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text('Patient Portal',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
        actions:
        //(controller3.isSelecting)
        //     ? <Widget>[
        //   Row(
        //     children: [
        //       GestureDetector(
        //         onTap: (){},
        //         child: Container(
        //             width: 18,
        //             height: 18,
        //             child:Image.asset('assets/icons/slt.png')),
        //       ),
        //       SizedBox(width: 15,),
        //       GestureDetector(
        //         onTap: (){delete();},
        //         child: Container(
        //             width: 18,
        //             height: 18,
        //             child:Image.asset('assets/icons/dlt.png')),
        //       ),
        //       SizedBox(width: 15,),
        //       GestureDetector(
        //         child: Container(
        //             width: 18,
        //             height: 18,
        //             child:Image.asset('assets/icons/sh.png')),
        //       ),
        //       SizedBox(width: 15,),
        //       GestureDetector(
        //         child: Container(
        //             width: 18,
        //             height: 18,
        //             child:Image.asset('assets/icons/dwn.png')),
        //       ),
        //       SizedBox(width: 15,),
        //     ],
        //   ),
        // ]
        //     :
        <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
            },
          )
        ],
        // leading: new IconButton(
        //     icon: new Icon(Icons.notes),
        //     onPressed: () => _scaffoldKey.currentState.openDrawer()),
        // leading: Container(
        //     child:  IconButton(
        //         icon: Icon(Icons.notes),
        //         onPressed: () {
        //           widget.menuCallBack();
        //         })
        // ),
      ),
      // drawer: Drawer(
      //   child: ListView(children: [
      //     RaisedButton(onPressed:(){
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=> SwitchAccount()));
      //     },
      //       child: Text("Switch Account", style: GoogleFonts.poppins(
      //       ),),
      //
      //     )
      //   ],),
      // ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(maxHeight: 150.0),
              child: Material(
                color: HexColor('#E9ECFE'),
                child: TabBar(
                  indicatorColor: HexColor('#8592E5'),
                  indicatorWeight:4,
                  tabs: [
                    Container(
                      height: 40,
                      //width: 10.0,
                      child:Center(child: Text('Prescriptions',style: GoogleFonts.roboto(color: HexColor('#354291',),fontWeight: FontWeight.w500),)),
                    ),
                    Container(
                      height: 40,
                      child: Center(child: Text('Reports',style: GoogleFonts.roboto(color: HexColor('#354291'),fontWeight: FontWeight.w500),)),
                    ),
                    Container(
                      height: 40,
                      //width: 30.0,
                      child:Center(child: Text('Documents',style: GoogleFonts.roboto(color: HexColor('#354291'),fontWeight: FontWeight.w500),)),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RefreshIndicator(
                    onRefresh: (){
                      _searchTextEditingController?.clear();
                      // Provider.of<FeaturedJobListViewModel>(context, listen: false)
                      //     .resetState();
                      return Provider.of<PrescriptionListViewModel>(context, listen: false)
                          .refresh(widget.accessToken);
                    },
                    child: WillPopScope(
                      onWillPop: () async {
                        //block app from quitting when selecting
                        var before = !controller.isSelecting;
                        setState(() {
                          controller.deselectAll();
                        });
                        return before;
                      },
                      child: Scaffold(
                          body:

                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:12.0),
                                    child: Text("${vm.totalCount.toString()} Prescription(s) found",style: GoogleFonts.poppins(fontSize: 10),),
                                  ),
                                  Spacer(),
                                  if (vm.isInSearchMode)searchField,
                                  IconButton(
                                    key: Key('featuredJobSearchToggleButtonKey'),
                                    icon: Icon(vm.isInSearchMode ? Icons.close : Icons.search),
                                    onPressed: () {
                                      _searchTextEditingController?.clear();
                                      vm.toggleIsInSearchMode(widget.accessToken);

                                      if (vm.isInSearchMode) {
                                        _searchFieldFocusNode.requestFocus();
                                      } else {
                                        _searchFieldFocusNode.unfocus();
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Expanded(
                                child:
                                // vm.shouldShowPageLoader
                                //     ? Center(
                                //   child: CircularProgressIndicator(  valueColor:
                                //   AlwaysStoppedAnimation<Color>(
                                //       AppTheme.appbarPrimary),),
                                // ):vm.prescriptionList.length==0
                                //     ? lengthofPrescriptionList
                                //
                                //     :
                                (vm.prescriptionList.length == 0 &&
                                    !vm.isFetchingData) ? Center(
                                  child: CircularProgressIndicator(  valueColor:
                                  AlwaysStoppedAnimation<Color>(
                                      AppTheme.appbarPrimary),),
                                ): lengthofPrescriptionList == 0 ? Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:200.0),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          pp,
                                          SizedBox(height: 10,),
                                          Text('You have no prescription available now',style: GoogleFonts.poppins(color: HexColor('#AEB0BA'),fontWeight: FontWeight.w400,fontSize: 16),),

                                        ],
                                      ),
                                    ),
                                  ),
                                ) :
                                ListView.builder(
                                    controller: _scrollController,
                                shrinkWrap: true,
                                itemCount:lengthofPrescriptionList+1,
                                itemBuilder: (BuildContext context, int index) {
                                  //print("LIIIISSSYYSY:::" + list[index].consultationId);

                                  if(index==lengthofPrescriptionList){
                                    return vm.isFetchingMoreData?SizedBox(height:60 ,child: Center(child: CircularProgressIndicator())):SizedBox();
                                    //return SizedBox(height: 15,);

                                  }
                                  return MultiSelectItem(
                                    isSelecting: controller.isSelecting,
                                    onSelected: () {
                                      setState(() {
                                        controller.toggle(index);
                                      });
                                    },
                                    child: Stack(
                                        children:[
                                          InkWell(
                                            onLongPress: (){
                                              setState(() {
                                                controller.toggle(index);
                                              });
                                              print("tapped");},
                                            onTap: () async{


                                              if(controller.isSelecting){
                                                setState(() {
                                                  controller.toggle(index);
                                                });
                                              }else{
                                                print('PDFPRESSED');
                                                final file=await _createPdfFileFromString(vm.prescriptionList[index].prescriptionNo.toString());
                                                Navigator.push(context, PageTransition(
                                                  type: PageTransitionType.rightToLeft,
                                                  child:PdfViewerScreen(file),
                                                ),);
                                              }
                                              print("tappeddd");
                                            },
                                            child: Container(

                                              height: 100,
                                              margin: EdgeInsets.only(top: 8,bottom: 5,right: 10,left: 10),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                                                  1.0,
                                                  1.0
                                                ], colors: [
                                                  HexColor('#C5CAE8'),
                                                  HexColor('#E9ECFE'),

                                                ]),
                                                //color: Colors.white,
                                                // border: Border.all(
                                                //   color: HexColor("#E9ECFE"),
                                                //   width: 1,
                                                // ),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 31,
                                                    backgroundColor: HexColor('#354291').withOpacity(0.2),
                                                    child: CircleAvatar(
                                                      radius: 30,
                                                      backgroundColor: Colors.white,
                                                      child: CircleAvatar(
                                                        backgroundColor: Colors.white,
                                                        backgroundImage: AssetImage("assets/icons/dct.png"),
                                                        radius: 28,
                                                      ),
                                                    ),
                                                  ),
                                                  //SizedBox(width: 5,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:8.0,right: 8,bottom: 8,left: 1),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 8,),
                                                        Text(list[index].consultationId,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#354291'),fontSize: 12),),
                                                        Text(DateUtil().formattedDate(DateTime.parse(list[index].consTime).toLocal()),style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w500),),
                                                        SizedBox(height: 8,),
                                                        Container(width:MediaQuery.of(context).size.width*.5,child: Text(list[index].doctorName,maxLines: 1,overflow:TextOverflow.ellipsis,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 12,fontWeight: FontWeight.w600))),
                                                        Text(list[index].ogName,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w600))
                                                      ],
                                                    ),

                                                    ),
                                                    // Container(width:45,child: rx),
                                                    // (controller.isSelecting)?
                                                    // Padding(
                                                    //   padding: const EdgeInsets.only(bottom:40.0,right: 10),
                                                    //   child: righticon,
                                                    // ):
                                                    Padding(
                                                      padding: const EdgeInsets.only(right:0.0,),
                                                      child: Stack(children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(top:10.0),
                                                          child: Container(width:45,child: rx),
                                                        ),
                                                        // (controller.isSelected(index))?
                                                        // Padding(
                                                        //   padding: const EdgeInsets.only(left:38.0,top: 5),
                                                        //   child: righticon,
                                                        // ): (controller.isSelecting)?Padding(
                                                        //   padding: const EdgeInsets.only(left:38.0,top: 5),
                                                        //   child: greyright,
                                                        // ):Padding(
                                                        //   padding: EdgeInsets.only(left: 38,top: 5),
                                                        //   child: popup,
                                                        // ),
                                                      ]),
                                                    ),


                                                ],
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                  );
                                }),
                              ),
                            ],
                          )

                      ),
                    ),
                  ),



                  //REPORT Screen

                  WillPopScope(
                    onWillPop: () async {
                      //block app from quitting when selecting
                      var before = !controller2.isSelecting;
                      setState(() {
                        controller2.deselectAll();
                      });
                      return before;
                    },
                    child: Scaffold(
                      // body:
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(top:200.0),
                      //     child: Container(
                      //       child: Column(
                      //         children: [
                      //           pp,
                      //           SizedBox(height: 10,),
                      //           Text('You have no report available now',style: GoogleFonts.poppins(color: HexColor('#AEB0BA'),fontWeight: FontWeight.w400,fontSize: 16),),
                      //
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                        body:
                        Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:12.0,bottom: 20,top:10),
                                  child: Text("${vm2.totalCount.toString()} Report(s) found",style: GoogleFonts.poppins(fontSize: 10),),
                                ),
                                // Spacer(),
                                // searchField,
                              ],
                            ),
                            Expanded(
                              child:
                              // (vm2.reportList.length == 0 &&
                              //     !vm2.isFetchingData) ? Loader():
                              vm2.reportList.length == 0 ?
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(top:200.0),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        pp,
                                        SizedBox(height: 10,),
                                        Text('You have no report available now',style: GoogleFonts.poppins(color: HexColor('#AEB0BA'),fontWeight: FontWeight.w400,fontSize: 16),),

                                      ],
                                    ),
                                  ),
                                ),
                              )
                               : SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                  physics: ScrollPhysics(),
                                  child: Column(
                                    children: [
                                      ListView.builder( physics: NeverScrollableScrollPhysics(),
                                          itemCount:vm2.reportList.length,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int index) {
                                            return MultiSelectItem(
                                              isSelecting: controller2.isSelecting,
                                              onSelected: () {
                                                setState(() {
                                                  controller2.toggle(index);
                                                });
                                              },
                                              child: Stack(
                                                  children:[
                                                    InkWell(
                                                      onLongPress: (){
                                                        setState(() {
                                                          controller2.toggle(index);
                                                        });
                                                        print("tapped");},
                                                      onTap: (){

                                                        if(controller2.isSelecting){
                                                          setState(() {
                                                            controller2.toggle(index);
                                                          });
                                                        }
                                                        print("tappeddd");
                                                      },
                                                      child: Container(
                                                        height: cardHeight*0.8,
                                                        margin: EdgeInsets.only(top: 8,bottom: 5,right: 10,left: 10),
                                                        decoration: BoxDecoration(
                                                          gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                                                            1.0,
                                                            1.0
                                                          ], colors: [
                                                            HexColor('#C5CAE8'),
                                                            HexColor('#E9ECFE'),

                                                          ]),
                                                          //color: Colors.white,
                                                          // border: Border.all(
                                                          //   color: HexColor("#E9ECFE"),
                                                          //   width: 1,
                                                          // ),
                                                          borderRadius: BorderRadius.circular(15),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(width: 10,),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top:8.0,right: 8,bottom: 8,left: 6),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  SizedBox(height: 5,),
                                                                  Text(vm2.reportList[index].attachmentTypeName,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#354291'),fontSize: 12),),
                                                                  Text(DateUtil().formattedDate(DateTime.parse(vm2.reportList[index].reportDate).toLocal()),style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w500),),
                                                                  // SizedBox(height: 8,),
                                                                  // Row(
                                                                  //   children: [
                                                                  //     CircleAvatar(
                                                                  //       radius: 18,
                                                                  //       backgroundColor: HexColor('#354291').withOpacity(0.2),
                                                                  //       child: CircleAvatar(
                                                                  //         backgroundColor: Colors.white,
                                                                  //         backgroundImage: AssetImage('assets/images/ap.png'),
                                                                  //         radius: 17,
                                                                  //       ),
                                                                  //     ),
                                                                  //     SizedBox(width: 15,),
                                                                  //     Text(reportList[index].hosName,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 12,fontWeight: FontWeight.w500)),
                                                                  //   ],
                                                                  // )
                                                                ],
                                                              ),
                                                            ),
                                                            Spacer(),
                                                            // Padding(
                                                            //   padding: const EdgeInsets.only(right:18.0),
                                                            //   child: Stack(children: [
                                                            //     Container(width:45,child: dx),
                                                            //     Padding(
                                                            //       padding: const EdgeInsets.only(left:30.0),
                                                            //       child: righticon,
                                                            //     ),
                                                            //   ]),
                                                            // ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(right:18.0),
                                                              child: Stack(children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(top:10.0,right: 5),
                                                                  child: Container(width:45,child: dx),
                                                                ),
                                                                // (controller2.isSelected(index))?
                                                                // Padding(
                                                                //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                                                //   child: righticon,
                                                                // ): (controller2.isSelecting)?Padding(
                                                                //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                                                //   child: greyright,
                                                                // ):Padding(
                                                                //   padding: EdgeInsets.only(left: 38),
                                                                //   child: popup,
                                                                // ),
                                                              ]),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ]
                                              ),
                                            );
                                          })
                                    ],
                                  )),
                            ),
                          ],
                        )

                    ),
                  ),



                  //Documentation Screen
                  WillPopScope(
                    onWillPop: () async {
                      //block app from quitting when selecting
                      var before = !controller3.isSelecting;
                      setState(() {
                        controller3.deselectAll();
                      });
                      return before;
                    },
                    child: Scaffold(
                      floatingActionButton: Padding(
                        padding: const EdgeInsets.only(bottom:10.0,right: 10),
                        child: UnicornDialer(
                            backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                            parentButtonBackground: HexColor('#8592E5'),
                            orientation: UnicornOrientation.VERTICAL,
                            parentButton: Icon(Icons.add),
                            childButtons: childButtons),
                      ),

                      // body:
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(top:200.0),
                      //     child: Container(
                      //       child: Column(
                      //         children: [
                      //           pp,
                      //           Text('Upload your documents here.',style: GoogleFonts.poppins(color: HexColor('#AEB0BA'),fontWeight: FontWeight.w400,fontSize: 16),),
                      //           Text('(JPG,PNG,PDF only)',style: GoogleFonts.poppins(color: HexColor('#AEB0BA'),fontWeight: FontWeight.w400,fontSize: 16)),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      body:   Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:12.0,bottom: 20),
                                child: Text("${vm3.totalCount.toString()} Document(s) found",style: GoogleFonts.poppins(fontSize: 10),),
                              ),
                              Spacer(),
                              if (vm3.isInSearchMode)searchFieldforDoc,
                              IconButton(
                                key: Key('featuredJButonKey'),
                                icon: Icon(vm3.isInSearchMode ? Icons.close : Icons.search),
                                onPressed: () {
                                  _searchTextEditingController3?.clear();
                                  vm3.toggleIsInSearchMode(widget.accessToken);

                                  if (vm3.isInSearchMode) {
                                    _searchFieldFocusNode3.requestFocus();
                                  } else {
                                    _searchFieldFocusNode3.unfocus();
                                  }
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            child:
                            // (vm3.documentList.length == null &&
                            //     !vm3.isFetchingData) ? Center(
                            //   child: CircularProgressIndicator(  valueColor:
                            //   AlwaysStoppedAnimation<Color>(
                            //       AppTheme.appbarPrimary),),
                            // ):
                            vm3.documentList.length ==0 ?
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(top:200.0),
                                child: Container(
                                  child: Column(
                                    children: [
                                      pp,
                                      Text('Upload your documents here.',style: GoogleFonts.poppins(color: HexColor('#AEB0BA'),fontWeight: FontWeight.w400,fontSize: 16),),
                                      Text('(JPG,PNG,PDF only)',style: GoogleFonts.poppins(color: HexColor('#AEB0BA'),fontWeight: FontWeight.w400,fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ),
                            )
                                :
                            ListView.builder(
                                //controller: _scrollController3,
                                itemCount:vm3.documentList.length,
                                shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) {
                                  // if(index==vm3.documentList.length){
                                  //   return vm3.isFetchingMoreData?SizedBox(height:60 ,child: Center(child: CircularProgressIndicator())):SizedBox();
                                  //   //return SizedBox(height: 15,);
                                  //
                                  // }
                                  return MultiSelectItem(
                                    isSelecting: controller3.isSelecting,
                                    onSelected: () {
                                      setState(() {
                                        controller3.toggle(index);
                                      });
                                    },
                                    child: Stack(
                                        children:[
                                          InkWell(
                                            onLongPress: (){
                                              setState(() {
                                                controller3.toggle(index);
                                              });
                                              print("tapped");},
                                            onTap: ()async{

                                              if(controller3.isSelecting){
                                                setState(() {
                                                  controller3.toggle(index);
                                                });
                                              }else{
                                                //await vm4.getData(filePath:vm3.documentList[index].attachmentPath);
                                                final filee=await _createPdfFileFrombase(vm3.documentList[index].attachmentPath);
                                                Navigator.push(context, PageTransition(
                                                  type: PageTransitionType.rightToLeft,
                                                  child:PdfViewerScreen(filee),
                                                ),);

                                                print('PDFPRESSEDFrom DOc');
                                              }
                                              print("tappeddd from Doc");
                                            },
                                            child: Container(
                                              height: cardHeight*0.6,
                                              margin: EdgeInsets.only(top: 8,bottom: 5,right: 10,left: 10),
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                                                  1.0,
                                                ], colors: [
                                                  //HexColor('#C5CAE8'),
                                                  HexColor('#E9ECFE'),

                                                ]),
                                                //color: Colors.white,
                                                // border: Border.all(
                                                //   color: HexColor("#E9ECFE"),
                                                //   width: 1,
                                                // ),
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(width: 10,),
                                                  Padding(
                                                    padding: const EdgeInsets.only(top:8.0,right: 8,bottom: 8,left: 6),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        SizedBox(height: 10,),
                                                        Container(width: 200,child: Text(vm3.documentList[index].attachmentName==null?'Doc':vm3.documentList[index].attachmentName,maxLines: 1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#354291'),fontSize: 12),)),
                                                        SizedBox(height: 5,),
                                                        Text(DateUtil().formattedDate(DateTime.parse(vm3.documentList[index].reportDate).toLocal()),style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w500),),
                                                        SizedBox(height: 5,),
                                                      ],
                                                    ),
                                                  ),

                                                  // Padding(
                                                  //   padding: const EdgeInsets.only(right:18.0),
                                                  //   child: Stack(children: [
                                                  //     Container(width:45,child: dx),
                                                  //     Padding(
                                                  //       padding: const EdgeInsets.only(left:30.0),
                                                  //       child: righticon,
                                                  //     ),
                                                  //   ]),
                                                  // ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:25.0),
                                                    child: Stack(children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(top:5.0,right: 10),
                                                        child: Container(width:45,child: jp),
                                                      ),
                                                      // (controller3.isSelected(index))?
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                                      //   child: righticon,
                                                      // ): (controller3.isSelecting)?
                                                      // Padding(
                                                      //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                                      //   child: greyright,
                                                      // ):
                                                      // // Padding(
                                                      // //   padding: EdgeInsets.only(left: 40,top: 10),
                                                      // //   child: InkWell(onTap: () async{
                                                      // //   await  vm6.deleteDocuments(accessToken: widget.accessToken,id:  vm3.documentList[index].id,attachmentName:  vm3.documentList[index].attachmentName,attachmentPath:  vm3.documentList[index].attachmentPath,attachmentTypeNo:  vm3.documentList[index].attachmentTypeNo,description:  vm3.documentList[index].description,activeStatus:  vm3.documentList[index].activeStatus,regId:  vm3.documentList[index].regId,type:  vm3.documentList[index].type,);
                                                      // //   },child: Icon(Icons.delete)),
                                                      // // ),
                                                      Padding(
                                                        padding: EdgeInsets.only(left: 70,top: 10),
                                                        child: InkWell(onTap: () async{
                                                          vm3.getData(accessToken: widget.accessToken,id: vm3.documentList[index].id,);
                                                          _showAlertDialogForEditProfile(context);

                                                        },child: Icon(Icons.edit,color: HexColor('#354291'),)),
                                                      ),
                                                    ]),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ]
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  void _showAlertDialogForEditProfile(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return EditDocAlert();
        }).then((value) {
      setState(() {});
    });
  }
}


class DateUtil {
  static const DATE_FORMAT = 'yyyy-MM-dd HH:mm:ss';
  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}