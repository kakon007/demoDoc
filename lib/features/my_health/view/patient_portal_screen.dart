import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view/sign_in_screen.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/constant.dart';
import 'package:myhealthbd_app/features/my_health/models/prescription_list_model.dart';
import 'package:myhealthbd_app/features/my_health/models/view_document_model.dart';
import 'package:myhealthbd_app/features/my_health/repositories/prescription_repository.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/doc_edit_prompt.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/document_list.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/local_notification.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/report_list.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/share_document_widget.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/upload_document_screen.dart';
import 'package:myhealthbd_app/features/my_health/view_model/document_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/prescription_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/report_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/shared_file_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/upload_documents_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view_model/view_document_view_model.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/pdf_viewer.dart';
import 'package:open_file/open_file.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart' as pp;

class PrescriptionListScreen extends StatefulWidget {
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

  TextEditingController _searchTextEditingController2 = TextEditingController();
  var _searchFieldFocusNode2 = FocusNode();

  TextEditingController _searchTextEditingController3 = TextEditingController();
  var _searchFieldFocusNode3 = FocusNode();

  List<Datum> dataList2 = List<Datum>();
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
  bool isLoading = false;

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

  List<DocumentList> docList = [
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

  ScrollController _scrollController3 = ScrollController();

  Future<PrescriptionListModel> fetchedData;

  Future fetchPDF(String index) async {
    try {
      print("FETCHPDFDATA");
      print('INDEX' + index);
      var headers = {'Authorization': 'Bearer ${accessTokenVm.accessToken}'};
      var request = http.MultipartRequest('POST', Uri.parse(Urls.prescriptionViewUrl));
      request.fields.addAll({'prescriptionId': index, 'pClient': 'aalok', 'pLayout': '1'});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = await response.stream.toBytes();
        print("BODYOFSTRING:::" + body.toString());
        return body;
      } else {
        print("ERROROFSTRING::::" + response.reasonPhrase);
        return null;
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
    SVProgressHUD.show(status: 'Opening Pdf');
    String dir = (await pp.getApplicationDocumentsDirectory()).path;
    File file = File("$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".pdf");
    await file.writeAsBytes(await fetchPDF(index), flush: true);
    print("FILEEEEE" + file.toString());
    SVProgressHUD.dismiss();
    return file;
  }

  showNotification(String path) async {
    var android = AndroidNotificationDetails('channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high, importance: Importance.max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.show(0, 'Downloaded', path, platform, payload: path);
  }

  Future<File> _downloadPdfFileFromString(String index, String conId) async {
    // final encodedStr='''''';
    // Uint8List bytes = base64.decode(encodedStr);
    SVProgressHUD.show(status: 'Downloading');
    String filePath = '';
    String dir = (await pp.getExternalStorageDirectory()).path;
    filePath = "$dir/" + conId + ".pdf";
    File file = File(filePath);
    await file.writeAsBytes(await fetchPDF(index));
    print("FILEEEEE" + file.toString());
    SVProgressHUD.dismiss();
    showNotification(filePath);
    //return file;
  }

///////////////////////////////////////
  Future<String> fetchDocFile(String filePath) async {
    var accessToken =
        await Provider.of<AccessTokenProvider>(appNavigator.context, listen: false).getToken();
    try {
      var headers = {'Authorization': 'Bearer $accessToken', 'Content-Type': 'text/plain'};
      var request = http.Request(
          'POST', Uri.parse('${Urls.baseUrl}diagnostic-api/api/file-attachment/file-by-name'));
      request.body = json.encode({"attachmentPath": filePath});
      print("Fillleeee:::: $filePath");
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      print('resssskj ${response.statusCode}');
      if (response.statusCode == 200) {
        var body = await response.stream.bytesToString();
        ViewDocumentModel data = viewDocumentModelFromJson(body);
        String obj = data.obj;
        print('fileOBJ::::: $obj');
        return obj;
      } else {
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

  downloadDocumentations(String filePath, String fileName) async {
    SVProgressHUD.show(status: 'Downloading');
    String docFilee = await fetchDocFile(filePath);
    Uint8List bytes = base64.decode(docFilee);
    // final output = await pp.getTemporaryDirectory();
    // final file = File("${output.path}/example.pdf");
    String filePat = '';
    String dir = (await pp.getExternalStorageDirectory()).path;
    filePat = "$dir/" + fileName;
    File file = File(filePat);
    await file.writeAsBytes(bytes.buffer.asUint8List());

    //print("${output.path}/example.pdf");
    print("Documentationnnn:::: $filePat");
    SVProgressHUD.dismiss();
    showNotification(filePat);
    //await OpenFile.open("${output.path}/example.pdf");
    // setState(() {});
  }

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var accessTokenVm;
  @override
  var width;

  void initState() {
    accessTokenVm = Provider.of<AccessTokenProvider>(context, listen: false);
    PrescriptionRepository().fetchPrescriptionList(accessToken: accessTokenVm.accessToken);
    super.initState();
    var vm = Provider.of<PrescriptionListViewModel>(context, listen: false);
    vm.getData(accessTokenVm.accessToken);
    var vm2 = Provider.of<ReportViewModel>(context, listen: false);
    vm2.getData();
    var vm3 = Provider.of<DocumentViewModel>(context, listen: false);
    vm3.getDataforDoc();
    var vm10 = Provider.of<SharedFileViewModel>(context, listen: false);
    vm10.getData();
    // print('pres ::: ${widget.prescriptionNo}');

    // Future.delayed(Duration.zero, () async {
    //   await Provider.of<UploadDocumentsViewModel>(context, listen: false)
    //       .deleteDocuments(accessToken: accessTokenVm.accessToken);
    // });
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
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100) {
        vm.getMoreData(accessTokenVm.accessToken);
      }
    });
    _scrollController3.addListener(() {
      if (_scrollController3.position.pixels >= _scrollController3.position.maxScrollExtent - 100) {
        print('scrolklinggtatg');
        vm3.getMoreData(accessTokenVm.accessToken);
      }
    });

    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    OpenFile.open(payload);
  }

  void delete() {
    var vm3 = Provider.of<DocumentViewModel>(context, listen: false);
    var list = controller3.selectedIndexes;
    //var list2 = controller2.selectedIndexes;
    list.sort((b, a) => a.compareTo(b)); //reoder from biggest number, so it wont error
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

  bool descTextShowFlag = false;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var accessTokenVm = Provider.of<AccessTokenProvider>(context, listen: true);
    var vm = Provider.of<PrescriptionListViewModel>(context, listen: true);
    List<Datum> list = vm.prescriptionList;
    var lengthofPrescriptionList = list.length;
    var vm2 = Provider.of<ReportViewModel>(context, listen: true);
    var vm3 = Provider.of<DocumentViewModel>(context, listen: true);
    var vm4 = Provider.of<ViewDocumentViewModel>(context, listen: true);
    var vm6 = Provider.of<UploadDocumentsViewModel>(context, listen: true);
    var vm10 = Provider.of<SharedFileViewModel>(context, listen: true);

    print("lltt::: ${vm3.documentList.length}");
    //var childButtons = List<UnicornButton>();
    var width = MediaQuery.of(context).size.width * 0.44;
    var deviceWidth = MediaQuery.of(context).size.width;
    print("Device $deviceWidth");
    var height = MediaQuery.of(context).size.height;

    final String assetName4 = "assets/images/dx.svg";
    final String assetName2 = "assets/icons/right.svg";
    final String assetName7 = "assets/icons/greyright.svg";
    final String assetName5 = "assets/icons/pp.svg";
    final String assetName6 = "assets/icons/jp.svg";
    final String assetName8 = "assets/icons/upload.svg";
    final String assetName9 = "assets/icons/cm.svg";

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
      width: isTablet ? 100 : 80,
      height: isTablet ? 120 : 100,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final Widget jp = SvgPicture.asset(
      assetName6,
      width: 80,
      height: 100,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final Widget uploadIcon = SvgPicture.asset(
      assetName8,
      width: 20,
      height: 15,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );
    final Widget cm = SvgPicture.asset(
      assetName9,
      width: 20,
      height: 15,
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
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (context, anim1, anim2) {
          return Stack(
            children: [
              Align(
                // alignment: Alignment.bottomCenter,
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    height: 200,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [HexColor('#fdf0f2'), HexColor('#FFFFFF')],
                        tileMode: TileMode.repeated,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60.0),
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
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Material(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          side: BorderSide(color: HexColor('#354291'))),
                                      color: Colors.white,
                                      child: SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Cancel",
                                              style: TextStyle(
                                                  color: HexColor('#354291'),
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Material(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)),
                                      color: HexColor('#354291'),
                                      child: SizedBox(
                                        height: 50,
                                        width: 150,
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Remove",
                                              style: TextStyle(
                                                  color: Colors.white, fontWeight: FontWeight.bold),
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
                top: MediaQuery.of(context).size.height / 3.35,
                left: 100,
                right: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: Constants.avatarRadius,
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                      child: Image.asset("assets/images/warning.png")),
                ),
              ),
            ],
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position: Tween(begin: Offset(0, 2), end: Offset(0, 0)).animate(anim1),
            child: child,
          );
        },
      );
    }

    // childButtons.add(UnicornButton(
    //     hasLabel: true,
    //     labelText: " Upload Documents\n(JPG,PNG,PDF only)",
    //     labelColor: HexColor("#354291") ,
    //     labelBackgroundColor: HexColor("#E9ECFE"),
    //     labelFontSize: 10,
    //     currentButton: FloatingActionButton(
    //       onPressed: (){
    //         Navigator.push(context, PageTransition(
    //           type: PageTransitionType.rightToLeft,
    //           child:UploadDocumentScreen(),
    //         ),);
    //       },
    //         heroTag: "airplane",
    //         backgroundColor: HexColor("#354291"),
    //         mini: true,
    //         child: uploadIcon)));

    // void handleClick(String value) {
    //   switch (value) {
    //     case 'Share':
    //       {
    //         showModalBottomSheet(
    //             backgroundColor: HexColor("#E9ECFE"),
    //             shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(25),
    //                     topRight: Radius.circular(25))),
    //             context: context,
    //             isScrollControlled: true,
    //             builder: (context) {
    //               return StatefulBuilder(
    //                   builder: (BuildContext context, StateSetter setState) {
    //                     var index = 0;
    //                     bool isTrue = false;
    //                     return FractionallySizedBox(
    //                         heightFactor: 0.65,
    //                         child:ShareDocument()
    //                     );
    //                   });
    //             });
    //       }
    //       break;
    //     case 'Download':
    //       break;
    //
    //   }
    // }

    void handleClickForDocuments(String value) {
      switch (value) {
        case 'Share':
          {
            showModalBottomSheet(
                backgroundColor: HexColor("#E9ECFE"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25), topRight: Radius.circular(25))),
                context: context,
                isScrollControlled: true,
                builder: (context) {
                  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                    var index = 0;
                    bool isTrue = false;
                    return FractionallySizedBox(heightFactor: 0.65, child: ShareDocument());
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
    // var popup= Padding(
    //   padding: EdgeInsets.only(bottom: 60,right: 1),
    //   child: Container(
    //     //margin: EdgeInsets.only(bottom: 60,),
    //     width: 25,
    //     height: 30,
    //     child: PopupMenuButton<String>(
    //       onSelected: handleClick,
    //       itemBuilder: (BuildContext context) {
    //         return {'Share', 'Download'}.map((String choice) {
    //           return PopupMenuItem<String>(
    //             height: 30,
    //             value: choice,
    //             child: Text(choice,style:GoogleFonts.poppins(fontSize: 12),),
    //
    //           );
    //         }).toList();
    //       },
    //     ),
    //   ),);

    var popup2 = Padding(
      padding: EdgeInsets.only(bottom: 60, right: 1),
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
                child: Text(
                  choice,
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
              );
            }).toList();
          },
        ),
      ),
    );

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
    var searchField = Container(
        //height: 40,
        width: deviceWidth <= 360 ? 135 : 200,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 0),
          child:
              // Stack(
              //     children:[
              //Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.search_outlined,size: 25,), onPressed: null)),
              TextField(
            key: Key('prescriptionSearchFieldKey'),
            autofocus: false,
            textInputAction: TextInputAction.search,
            focusNode: _searchFieldFocusNode,
            controller: _searchTextEditingController,
            cursorColor: HexColor('#C5CAE8'),
            decoration: InputDecoration(
                hintText: 'Search prescriptions',
                hintStyle: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400),
                //labelText: "Resevior Name",
                fillColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor('#354291').withOpacity(0.5), width: 1.5),
                  //borderRadius: BorderRadius.circular(25.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search_sharp, color: Colors.black),
                  key: Key('prescriptionSearchIconKey'),
                  onPressed: () {
                    vm.search(_searchTextEditingController.text, accessTokenVm.accessToken);
                  },
                )),
            // onChanged: (text) {
            //   //value = text;
            // },
            onSubmitted: (v) {
              vm.search(_searchTextEditingController.text, accessTokenVm.accessToken);
            },
          ),
          //     ]
          // ),
        ));

    var searchFieldforDoc = Container(
        //height: 40,
        width: deviceWidth <= 360 ? 135 : 200,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 12),
          child:
              // Stack(
              //     children:[
              //Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.search_outlined,size: 25,), onPressed: null)),
              TextField(
            key: Key('documentationSearchFieldKey'),
            autofocus: false,
            textInputAction: TextInputAction.search,
            focusNode: _searchFieldFocusNode3,
            controller: _searchTextEditingController3,
            cursorColor: HexColor('#C5CAE8'),
            decoration: InputDecoration(
                hintText: 'Search documentations',
                hintStyle: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400),
                //labelText: "Resevior Name",
                fillColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor('#354291').withOpacity(0.5), width: 1.5),
                  //borderRadius: BorderRadius.circular(25.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search_sharp,
                    color: Colors.black,
                  ),
                  key: Key('documentationSearchIconKey'),
                  onPressed: () {
                    vm3.search(_searchTextEditingController3.text, accessTokenVm.accessToken);
                  },
                )),
            // onChanged: (text) {
            //   //value = text;
            // },
            onSubmitted: (v) {
              vm3.search(_searchTextEditingController3.text, accessTokenVm.accessToken);
            },
          ),
          //     ]
          // ),
        ));

    var searchFieldforReport = Container(
        //height: 40,
        width: deviceWidth <= 360 ? 135 : 200,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 12),
          child:
              // Stack(
              //     children:[
              //Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.search_outlined,size: 25,), onPressed: null)),
              TextField(
            autofocus: false,
            textInputAction: TextInputAction.search,
            focusNode: _searchFieldFocusNode2,
            controller: _searchTextEditingController2,
            cursorColor: HexColor('#C5CAE8'),
            key: Key('reportsSearchFieldKey'),
            decoration: InputDecoration(
                hintText: 'Search reports',
                hintStyle: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400),
                //labelText: "Resevior Name",
                fillColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: HexColor('#354291').withOpacity(0.5), width: 1.5),
                  //borderRadius: BorderRadius.circular(25.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.search_sharp,
                    color: Colors.black,
                  ),
                  key: Key('reportsSearchIconKey'),
                  onPressed: () {
                    vm3.search(_searchTextEditingController2.text, accessTokenVm.accessToken);
                  },
                )),
            // onChanged: (text) {
            //   //value = text;
            // },
            onSubmitted: (v) {
              vm3.search(_searchTextEditingController2.text, accessTokenVm.accessToken);
            },
          ),
          //     ]
          // ),
        ));

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text(
          'Patient Portal',
          key: Key('patientPortalAppbarKey'),
          style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500),
        ),
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
          // IconButton(
          //   icon: Icon(
          //     Icons.notifications,
          //     color: Colors.white,
          //     size: 20,
          //   ),
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
          //   },
          // )
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
                  indicatorWeight: 4,
                  tabs: [
                    ...[
                      "Prescriptions",
                      'Reports',
                      'Documents',
                    ].map(
                      (e) => FittedBox(
                        child: Container(
                          height: 40,
                          child: Center(
                              child: Text(
                            e,
                            style: GoogleFonts.roboto(
                                color: HexColor(
                                  '#354291',
                                ),
                                fontSize: isMobile ? 12 : 20,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                    // Container(
                    //   height: 40,
                    //   child: Center(
                    //       child: Text(
                    //     'Reports',
                    //     key: Key('reportsTabKey'),
                    //     style: GoogleFonts.roboto(
                    //         color: HexColor('#354291'),
                    //         fontSize: isTablet
                    //             ? 20
                    //             : width <= 330
                    //                 ? 12
                    //                 : 15,
                    //         fontWeight: FontWeight.w500),
                    //   )),
                    // ),
                    // Container(
                    //   height: 40,
                    //   //width: 30.0,
                    //   child: Center(
                    //       child: Text(
                    //     'Documents',
                    //     key: Key('documentationTabKey'),
                    //     style: GoogleFonts.roboto(
                    //         color: HexColor('#354291'),
                    //         fontSize: isTablet
                    //             ? 20
                    //             : width <= 330
                    //                 ? 12
                    //                 : 15,
                    //         fontWeight: FontWeight.w500),
                    //   )),
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  RefreshIndicator(
                    onRefresh: () {
                      _searchTextEditingController?.clear();
                      // Provider.of<FeaturedJobListViewModel>(context, listen: false)
                      //     .resetState();
                      return Provider.of<PrescriptionListViewModel>(context, listen: false)
                          .refresh(accessTokenVm.accessToken);
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
                          body: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: isTablet ? 20 : 12.0),
                                child: Text(
                                  "${vm.totalCount.toString()} Prescription(s) found",
                                  style: GoogleFonts.poppins(
                                      fontSize: isTablet
                                          ? 15
                                          : deviceWidth <= 360
                                              ? 10
                                              : 11),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                width: 8,
                              ),
                              if (vm.isInSearchMode) searchField,
                              IconButton(
                                key: Key('prescriptionsSearchKey'),
                                icon: Icon(vm.isInSearchMode ? Icons.close : Icons.search,
                                    color: Colors.grey),
                                onPressed: () {
                                  _searchTextEditingController?.clear();
                                  vm.toggleIsInSearchMode(accessTokenVm.accessToken);

                                  if (vm.isInSearchMode) {
                                    _searchFieldFocusNode.requestFocus();
                                  } else {
                                    _searchFieldFocusNode.unfocus();
                                  }
                                },
                              ),
                              SizedBox(
                                width: isTablet ? 20 : 0,
                              )
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
                                vm.prescriptionList.length == 0
                                    ?
                                    // Center(
                                    //   child: CircularProgressIndicator(
                                    //     valueColor:
                                    //     AlwaysStoppedAnimation<Color>(
                                    //         AppTheme.appbarPrimary),
                                    //   ),
                                    // )
                                    //     : lengthofPrescriptionList == 0
                                    //     ?
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              pp,
                                              SizedBox(
                                                height: isTablet ? 20 : 10,
                                              ),
                                              Text(
                                                'You have no prescription available now',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    color: HexColor('#AEB0BA'),
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: isTablet ? 22 : 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : ListView.builder(
                                        controller: _scrollController,
                                        shrinkWrap: true,
                                        itemCount: lengthofPrescriptionList + 1,
                                        itemBuilder: (BuildContext context, int index) {
                                          //print("LIIIISSSYYSY:::" + list[index].consultationId);

                                          if (index == lengthofPrescriptionList) {
                                            return vm.isFetchingMoreData
                                                ? SizedBox(
                                                    height: 60,
                                                    child:
                                                        Center(child: CircularProgressIndicator()))
                                                : SizedBox();
                                            //return SizedBox(height: 15,);

                                          }
                                          return MultiSelectItem(
                                            isSelecting: controller.isSelecting,
                                            onSelected: () {
                                              setState(() {
                                                controller.toggle(index);
                                              });
                                            },
                                            child: Stack(children: [
                                              InkWell(
                                                onLongPress: () {
                                                  setState(() {
                                                    controller.toggle(index);
                                                  });
                                                  print("tapped");
                                                },
                                                onTap: () async {
                                                  if (controller.isSelecting) {
                                                    setState(() {
                                                      controller.toggle(index);
                                                    });
                                                  } else {
                                                    print('PDFPRESSED');

                                                    final file =
                                                        vm.prescriptionList[index].prescriptionNo ==
                                                                null
                                                            ? Fluttertoast.showToast(
                                                                msg: 'Prescription Not Saved yet!')
                                                            : await _createPdfFileFromString(vm
                                                                .prescriptionList[index]
                                                                .prescriptionNo
                                                                .toString());
                                                    vm.prescriptionList[index].prescriptionNo ==
                                                            null
                                                        ? Fluttertoast.showToast(
                                                            msg: 'Prescription Not Saved yet!')
                                                        : Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type: PageTransitionType.rightToLeft,
                                                              child: PdfFileViewerScreen(
                                                                  file,
                                                                  vm.prescriptionList[index]
                                                                      .consultationId),
                                                            ),
                                                          );
                                                  }
                                                  print("tappeddd");
                                                },
                                                key: Key('showPrescriptionKey$index'),
                                                child: Container(
                                                  height: isTablet
                                                      ? 130
                                                      : deviceWidth <= 360
                                                          ? 60
                                                          : cardHeight * 0.7,
                                                  margin: EdgeInsets.only(
                                                      top: isTablet ? 8 : 8,
                                                      bottom: isTablet ? 10 : 5,
                                                      right: isTablet ? 20 : 10,
                                                      left: isTablet ? 20 : 10),
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                        begin: Alignment.bottomRight,
                                                        stops: [
                                                          1.0,
                                                          1.0
                                                        ],
                                                        colors: [
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
                                                  child: Padding(
                                                    padding: EdgeInsets.only(right: 8.0, left: 8),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: isTablet
                                                                  ? 40
                                                                  : deviceWidth <= 360
                                                                      ? 22
                                                                      : 25,
                                                              backgroundColor: HexColor('#354291')
                                                                  .withOpacity(0.2),
                                                              child: CircleAvatar(
                                                                radius: isTablet
                                                                    ? 40
                                                                    : deviceWidth <= 360
                                                                        ? 22
                                                                        : 25,
                                                                backgroundColor: Colors.white,
                                                                child: Container(
                                                                  height: isTablet
                                                                      ? 50
                                                                      : deviceWidth <= 360
                                                                          ? 28
                                                                          : 30,
                                                                  width: isTablet
                                                                      ? 50
                                                                      : deviceWidth <= 360
                                                                          ? 28
                                                                          : 30,
                                                                  child: Image.asset(
                                                                    "assets/icons/dct.png",
                                                                    fit: BoxFit.fitHeight,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            //SizedBox(width: 5,),
                                                            Padding(
                                                              padding: EdgeInsets.only(left: 15.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment.start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Container(
                                                                      alignment: Alignment.center,
                                                                      child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        children: [
                                                                          Text(
                                                                            list[index]
                                                                                .consultationId,
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                                    fontWeight:
                                                                                        FontWeight
                                                                                            .bold,
                                                                                    color: HexColor(
                                                                                        '#354291'),
                                                                                    fontSize: isTablet
                                                                                        ? 16
                                                                                        : width <= 330
                                                                                            ? 10
                                                                                            : 12),
                                                                          ),
                                                                          Text(
                                                                            DateUtil().formattedDate(
                                                                                DateTime.parse(list[
                                                                                            index]
                                                                                        .consTime)
                                                                                    .toLocal()),
                                                                            style:
                                                                                GoogleFonts.poppins(
                                                                                    color: HexColor(
                                                                                        '#141D53'),
                                                                                    fontSize:
                                                                                        isTablet
                                                                                            ? 16
                                                                                            : width <=
                                                                                                    330
                                                                                                ? 8
                                                                                                : 10,
                                                                                    fontWeight:
                                                                                        FontWeight
                                                                                            .w500),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                      flex: 1,
                                                                      child: Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child: Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment
                                                                                    .start,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment
                                                                                    .center,
                                                                            children: [
                                                                              Container(
                                                                                  width: MediaQuery.of(
                                                                                              context)
                                                                                          .size
                                                                                          .width *
                                                                                      .5,
                                                                                  child: Text(
                                                                                      list[index]
                                                                                          .doctorName,
                                                                                      maxLines: 1,
                                                                                      overflow:
                                                                                          TextOverflow
                                                                                              .ellipsis,
                                                                                      style: GoogleFonts.poppins(
                                                                                          color: HexColor('#141D53'),
                                                                                          fontSize: isTablet
                                                                                              ? 16
                                                                                              : width <= 330
                                                                                                  ? 10
                                                                                                  : 12,
                                                                                          fontWeight: FontWeight.w600))),
                                                                              Text(
                                                                                  list[index]
                                                                                      .ogName,
                                                                                  style: GoogleFonts.poppins(
                                                                                      color: HexColor('#141D53'),
                                                                                      fontSize: isTablet
                                                                                          ? 16
                                                                                          : width <= 330
                                                                                              ? 8
                                                                                              : 10,
                                                                                      fontWeight: FontWeight.w600))
                                                                            ],
                                                                          ))),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),

                                                        // Container(width:45,child: rx),
                                                        // (controller.isSelecting)?
                                                        // Padding(
                                                        //   padding: const EdgeInsets.only(bottom:40.0,right: 10),
                                                        //   child: righticon,
                                                        // ):
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            right: 0.0,
                                                          ),
                                                          child: Row(children: [
                                                            // Padding(
                                                            //   padding: const EdgeInsets.only(top:10.0),
                                                            //   child: Container(width:45,child: rx),
                                                            // ),
                                                            // (controller.isSelected(index))?
                                                            // Padding(
                                                            //   padding: const EdgeInsets.only(left:38.0,top: 5),
                                                            //   child: righticon,
                                                            // ): (controller.isSelecting)?Padding(
                                                            //   padding: const EdgeInsets.only(left:38.0,top: 5),
                                                            //   child: greyright,
                                                            // ):
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 25),
                                                              child: GestureDetector(
                                                                  onTap: () async {
                                                                    vm
                                                                                .prescriptionList[
                                                                                    index]
                                                                                .prescriptionNo ==
                                                                            null
                                                                        ? Fluttertoast.showToast(
                                                                            msg:
                                                                                'Prescription Not Saved yet!')
                                                                        : await _downloadPdfFileFromString(
                                                                            vm
                                                                                .prescriptionList[
                                                                                    index]
                                                                                .prescriptionNo
                                                                                .toString(),
                                                                            vm
                                                                                .prescriptionList[
                                                                                    index]
                                                                                .consultationId);
                                                                  },
                                                                  // onTap: showNotification,
                                                                  child: Icon(
                                                                    Icons.download_rounded,
                                                                    key: Key(
                                                                        'prescriptionDownloadKey$index'),
                                                                    size: isTablet
                                                                        ? 25
                                                                        : deviceWidth <= 360
                                                                            ? 18
                                                                            : 20,
                                                                    color: AppTheme.appbarPrimary,
                                                                  )),
                                                            ),
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.only(bottom: 25),
                                                              child: GestureDetector(
                                                                  onTap: () async {
                                                                    SVProgressHUD.show(
                                                                        status: 'Please Wait');
                                                                    await vm10.getData(
                                                                        fileNo: vm
                                                                            .prescriptionList[index]
                                                                            .prescriptionNo);
                                                                    await vm10.fileInfo(
                                                                        fileNo: vm
                                                                            .prescriptionList[index]
                                                                            .prescriptionNo,
                                                                        regId: vm
                                                                            .prescriptionList[index]
                                                                            .registrationNo);
                                                                    SVProgressHUD.dismiss();
                                                                    vm.prescriptionList[index]
                                                                                .prescriptionNo ==
                                                                            null
                                                                        ? Fluttertoast.showToast(
                                                                            msg:
                                                                                'Prescription Not Saved yet!')
                                                                        : showModalBottomSheet(
                                                                            backgroundColor:
                                                                                HexColor("#E9ECFE"),
                                                                            shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.only(
                                                                                    topLeft: Radius
                                                                                        .circular(
                                                                                            25),
                                                                                    topRight: Radius
                                                                                        .circular(
                                                                                            25))),
                                                                            context: context,
                                                                            isScrollControlled:
                                                                                true,
                                                                            builder: (context) {
                                                                              return StatefulBuilder(
                                                                                  builder: (BuildContext
                                                                                          context,
                                                                                      StateSetter
                                                                                          setState) {
                                                                                var index = 0;
                                                                                bool isTrue = false;
                                                                                return FractionallySizedBox(
                                                                                    heightFactor:
                                                                                        0.85,
                                                                                    child:
                                                                                        ShareDocument());
                                                                              });
                                                                            });
                                                                    //print('CompanyName ${vm10.sharedFileList.last.companyName}');
                                                                  },
                                                                  // onTap: showNotification,
                                                                  child: Icon(
                                                                    Icons.share,
                                                                    key: Key(
                                                                        'prescriptionShareKey$index'),
                                                                    size: isTablet
                                                                        ? 25
                                                                        : deviceWidth <= 360
                                                                            ? 18
                                                                            : 20,
                                                                    color: AppTheme.appbarPrimary,
                                                                  )),
                                                            ),
                                                          ]),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          );
                                        }),
                          ),
                        ],
                      )),
                    ),
                  ),

                  //REPORT Screen

                  RefreshIndicator(
                      onRefresh: () {
                        _searchTextEditingController2.clear();
                        return Provider.of<ReportViewModel>(context, listen: false).refresh();
                      },
                      child: WillPopScope(
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
                            body: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: isTablet ? 20 : 12.0, bottom: 20, top: 10),
                                  child: Text(
                                    "${vm2.totalCount.toString()} Report(s) found",
                                    style: GoogleFonts.poppins(
                                        fontSize: isTablet
                                            ? 15
                                            : deviceWidth <= 360
                                                ? 10
                                                : 11),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: 15,
                                ),
                                if (vm2.isInSearchMode) searchFieldforReport,
                                IconButton(
                                  key: Key('reportsSearchKey'),
                                  icon: Icon(
                                    vm2.isInSearchMode ? Icons.close : Icons.search,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    _searchTextEditingController2?.clear();
                                    vm2.toggleIsInSearchMode(accessTokenVm.accessToken);

                                    if (vm2.isInSearchMode) {
                                      _searchFieldFocusNode2.requestFocus();
                                    } else {
                                      _searchFieldFocusNode2.unfocus();
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: isTablet ? 20 : 0,
                                )
                              ],
                            ),
                            Expanded(
                              child:
                                  // (vm2.reportList.length == 0 &&
                                  //     !vm2.isFetchingData) ? Loader():
                                  vm2.reportList.length == 0
                                      ? Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                pp,
                                                SizedBox(
                                                  height: isTablet ? 20 : 10,
                                                ),
                                                Text(
                                                  'You have no report available now',
                                                  key: Key('noAvailableReportKey'),
                                                  style: GoogleFonts.poppins(
                                                      color: HexColor('#AEB0BA'),
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: isTablet ? 22 : 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          physics: ScrollPhysics(),
                                          child: Column(
                                            children: [
                                              ListView.builder(
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: vm2.reportList.length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return MultiSelectItem(
                                                      isSelecting: controller2.isSelecting,
                                                      onSelected: () {
                                                        setState(() {
                                                          controller2.toggle(index);
                                                        });
                                                      },
                                                      child: Stack(children: [
                                                        InkWell(
                                                          onLongPress: () {
                                                            setState(() {
                                                              controller2.toggle(index);
                                                            });
                                                            print("tapped");
                                                          },
                                                          onTap: () {
                                                            if (controller2.isSelecting) {
                                                              setState(() {
                                                                controller2.toggle(index);
                                                              });
                                                            } else {
                                                              Navigator.push(
                                                                context,
                                                                PageTransition(
                                                                  type: PageTransitionType
                                                                      .rightToLeft,
                                                                  child: PdfbyteViewerScreen(
                                                                      vm2.reportList[index]
                                                                          .attachmentPath,
                                                                      vm2.reportList[index]
                                                                          .attachmentName),
                                                                ),
                                                              );
                                                            }
                                                            print("tappeddd");
                                                          },
                                                          key: Key('showReportKey$index'),
                                                          child: Container(
                                                            constraints: BoxConstraints(
                                                              minHeight: isTablet ? 75 : 60,
                                                            ),
                                                            // height:
                                                            //     isTablet? 75 : 60,
                                                            margin: EdgeInsets.only(
                                                                top: isTablet ? 8 : 8,
                                                                bottom: isTablet ? 10 : 5,
                                                                right: isTablet ? 20 : 10,
                                                                left: isTablet ? 20 : 10),
                                                            decoration: BoxDecoration(
                                                              gradient: LinearGradient(
                                                                  begin: Alignment.bottomRight,
                                                                  stops: [
                                                                    1.0,
                                                                    // 1.0
                                                                  ],
                                                                  colors: [
                                                                    // HexColor(
                                                                    //     '#C5CAE8'),
                                                                    HexColor('#E9ECFE'),
                                                                  ]),
                                                              //color: Colors.white,
                                                              // border: Border.all(
                                                              //   color: HexColor("#E9ECFE"),
                                                              //   width: 1,
                                                              // ),
                                                              borderRadius:
                                                                  BorderRadius.circular(15),
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 12.0,
                                                                      right: 8,
                                                                      bottom: 8,
                                                                      left: 6),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                    children: [
                                                                      SizedBox(
                                                                        height: 5,
                                                                      ),
                                                                      Text(
                                                                        vm2.reportList[index]
                                                                            .attachmentTypeName,
                                                                        style: GoogleFonts.poppins(
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              HexColor('#354291'),
                                                                          fontSize: isTablet
                                                                              ? 16
                                                                              : width <= 330
                                                                                  ? 10
                                                                                  : 12,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        DateUtil().formattedDate(
                                                                            DateTime.parse(vm2
                                                                                    .reportList[
                                                                                        index]
                                                                                    .reportDate)
                                                                                .toLocal()),
                                                                        style: GoogleFonts.poppins(
                                                                            color:
                                                                                HexColor('#141D53'),
                                                                            fontSize: isTablet
                                                                                ? 14
                                                                                : width <= 330
                                                                                    ? 8
                                                                                    : 10,
                                                                            fontWeight:
                                                                                FontWeight.w500),
                                                                      ),
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
                                                                  padding: const EdgeInsets.only(
                                                                      right: 18.0),
                                                                  child: Row(children: [
                                                                    // Padding(
                                                                    //   padding: const EdgeInsets.only(top:10.0,right: 5),
                                                                    //   child: Container(width:45,child: dx),
                                                                    // ),
                                                                    // (controller2.isSelected(index))?
                                                                    // Padding(
                                                                    //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                                                    //   child: righticon,
                                                                    // ): (controller2.isSelecting)?Padding(
                                                                    //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                                                    //   child: greyright,
                                                                    // ):
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                        right: 20,
                                                                      ),
                                                                      child: InkWell(
                                                                          onTap: () async {
                                                                            await downloadDocumentations(
                                                                                vm2
                                                                                    .reportList[
                                                                                        index]
                                                                                    .attachmentPath,
                                                                                vm2
                                                                                    .reportList[
                                                                                        index]
                                                                                    .attachmentName);
                                                                          },
                                                                          child: Icon(
                                                                            Icons.download_rounded,
                                                                            key: Key(
                                                                                'reportsDownloadKey$index'),
                                                                            size: isTablet
                                                                                ? 25
                                                                                : deviceWidth <= 360
                                                                                    ? 18
                                                                                    : 20,
                                                                            color: AppTheme
                                                                                .appbarPrimary,
                                                                          )),
                                                                    ),

                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    GestureDetector(
                                                                        onTap: () async {
                                                                          SVProgressHUD.show(
                                                                              status:
                                                                                  'Please Wait');
                                                                          await vm10.getData(
                                                                              fileNo: vm2
                                                                                  .reportList[index]
                                                                                  .id);
                                                                          await vm10.fileInfo(
                                                                              fileNo: vm2
                                                                                  .reportList[index]
                                                                                  .id,
                                                                              regId: vm2
                                                                                  .reportList[index]
                                                                                  .referenceNo);
                                                                          SVProgressHUD.dismiss();
                                                                          vm2.reportList[index]
                                                                                      .id ==
                                                                                  null
                                                                              ? Fluttertoast.showToast(
                                                                                  msg:
                                                                                      'Prescription Not Saved yet!')
                                                                              : showModalBottomSheet(
                                                                                  backgroundColor:
                                                                                      HexColor(
                                                                                          "#E9ECFE"),
                                                                                  shape: RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.only(
                                                                                          topLeft: Radius
                                                                                              .circular(
                                                                                                  25),
                                                                                          topRight:
                                                                                              Radius.circular(
                                                                                                  25))),
                                                                                  context: context,
                                                                                  isScrollControlled:
                                                                                      true,
                                                                                  builder:
                                                                                      (context) {
                                                                                    return StatefulBuilder(builder:
                                                                                        (BuildContext
                                                                                                context,
                                                                                            StateSetter
                                                                                                setState) {
                                                                                      var index = 0;
                                                                                      bool isTrue =
                                                                                          false;
                                                                                      return FractionallySizedBox(
                                                                                          heightFactor:
                                                                                              0.85,
                                                                                          child:
                                                                                              ShareDocument());
                                                                                    });
                                                                                  });
                                                                          //print('CompanyName ${vm10.sharedFileList.last.companyName}');
                                                                        },
                                                                        // onTap: showNotification,
                                                                        child: Icon(
                                                                          Icons.share,
                                                                          key: Key(
                                                                              'reportsShareKey$index'),
                                                                          size: isTablet
                                                                              ? 25
                                                                              : deviceWidth <= 360
                                                                                  ? 18
                                                                                  : 20,
                                                                          color: AppTheme
                                                                              .appbarPrimary,
                                                                        )),
                                                                  ]),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ]),
                                                    );
                                                  })
                                            ],
                                          )),
                            ),
                          ],
                        )),
                      )),

                  //Documentation Screen
                  RefreshIndicator(
                    onRefresh: () {
                      _searchTextEditingController3.clear();
                      return Provider.of<DocumentViewModel>(context, listen: false).refresh();
                    },
                    child: WillPopScope(
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
                          padding: const EdgeInsets.only(bottom: 10.0, right: 10),
                          child:
                              // UnicornDialer(
                              //     backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                              //     parentButtonBackground: HexColor('#8592E5'),
                              //     orientation: UnicornOrientation.VERTICAL,
                              //     parentButton: Icon(Icons.add),
                              //     childButtons: childButtons),

                              FloatingActionButton(
                            backgroundColor: HexColor('#8592E5'),
                            child: Icon(Icons.add),
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: UploadDocumentScreen(),
                                ),
                              ).then((value) {
                                setState(() {
                                  vm3.getDataforDoc();
                                });
                              });
                            },
                          ),
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

                        body: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: isTablet ? 20 : 12.0, bottom: 20),
                                  child: Text(
                                    "${vm3.totalCount.toString()} Document(s) found",
                                    style: GoogleFonts.poppins(
                                        fontSize: isTablet
                                            ? 15
                                            : deviceWidth <= 360
                                                ? 10
                                                : 11),
                                  ),
                                ),
                                Spacer(),
                                if (vm3.isInSearchMode) searchFieldforDoc,
                                IconButton(
                                  key: Key('documentationSearchKey'),
                                  icon: Icon(
                                    vm3.isInSearchMode ? Icons.close : Icons.search,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    _searchTextEditingController3?.clear();
                                    vm3.toggleIsInSearchMode(accessTokenVm.accessToken);

                                    if (vm3.isInSearchMode) {
                                      _searchFieldFocusNode3.requestFocus();
                                    } else {
                                      _searchFieldFocusNode3.unfocus();
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: isTablet ? 20 : 0,
                                )
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
                                  vm3.documentList.length == 0
                                      ? Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                pp,
                                                Text(
                                                  'Upload your documents here.',
                                                  style: GoogleFonts.poppins(
                                                      color: HexColor('#AEB0BA'),
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: isTablet ? 22 : 16),
                                                ),
                                                Text('(JPG,PNG,PDF only)',
                                                    style: GoogleFonts.poppins(
                                                        color: HexColor('#AEB0BA'),
                                                        fontWeight: FontWeight.w400,
                                                        fontSize: isTablet ? 22 : 16)),
                                              ],
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          controller: _scrollController3,
                                          itemCount: vm3.documentList.length + 1,
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context, int index) {
                                            if (index == vm3.documentList.length) {
                                              return vm3.isFetchingMoreData
                                                  ? SizedBox(
                                                      height: 60,
                                                      child: Center(
                                                          child: CircularProgressIndicator()))
                                                  : SizedBox();
                                              //return SizedBox(height: 15,);

                                            }
                                            return MultiSelectItem(
                                              isSelecting: controller3.isSelecting,
                                              onSelected: () {
                                                setState(() {
                                                  controller3.toggle(index);
                                                });
                                              },
                                              child: Stack(children: [
                                                InkWell(
                                                  onLongPress: () {
                                                    setState(() {
                                                      controller3.toggle(index);
                                                    });
                                                    print("tapped");
                                                  },
                                                  onTap: () async {
                                                    if (controller3.isSelecting) {
                                                      setState(() {
                                                        controller3.toggle(index);
                                                      });
                                                    } else {
                                                      String fileExt = vm3
                                                          .documentList[index].attachmentPath
                                                          .split('.')
                                                          .last;
                                                      Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type: PageTransitionType.rightToLeft,
                                                          child: fileExt == 'pdf'
                                                              ? PdfbyteViewerScreen(
                                                                  vm3.documentList[index]
                                                                      .attachmentPath,
                                                                  vm3.documentList[index]
                                                                      .attachmentName)
                                                              : ImagebyteViewerScreen(
                                                                  vm3.documentList[index]
                                                                      .attachmentPath,
                                                                  vm3.documentList[index]
                                                                      .attachmentName),
                                                        ),
                                                      );

                                                      print('PDFPRESSEDFrom DOc');
                                                    }
                                                    print("tappeddd from Doc");
                                                  },
                                                  key: Key('showDocumentationKey$index'),
                                                  child:

                                          // Container(
                                          //   // height: cardHeight*0.7,
                                          //   margin: EdgeInsets.only(top: 8,bottom: 5,right: 10,left: 10),
                                          //   decoration: BoxDecoration(
                                          //     gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                                          //       1.0,
                                          //     ], colors: [
                                          //       //HexColor('#C5CAE8'),
                                          //       HexColor('#E9ECFE'),
                                          //
                                          //     ]),
                                          //     //color: Colors.white,
                                          //     // border: Border.all(
                                          //     //   color: HexColor("#E9ECFE"),
                                          //     //   width: 1,
                                          //     // ),
                                          //     borderRadius: BorderRadius.circular(15),
                                          //   ),
                                          //   child: Row(
                                          //     children: [
                                          //       SizedBox(width: 10,),
                                          //       Padding(
                                          //         padding: const EdgeInsets.only(top:8.0,right: 8,bottom: 8,left: 6),
                                          //         child: Column(
                                          //           crossAxisAlignment: CrossAxisAlignment.start,
                                          //           children: [
                                          //             SizedBox(height: 10,),
                                          //             Container(width: 220,child: Text(vm3.documentList[index].attachmentName==null?'Doc':vm3.documentList[index].attachmentName,maxLines: 1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#354291'),fontSize: 12),)),
                                          //             SizedBox(height: 5,),
                                          //             Row(
                                          //               children: [
                                          //                 Text(DateUtil().formattedDate(DateTime.parse(vm3.documentList[index].reportDate).toLocal()),style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w500),),
                                          //                 SizedBox(width: 40,),
                                          //                 Container(width: 100,child: Text(vm3.documentList[index].attachmentTypeName==null?'':vm3.documentList[index].attachmentTypeName,maxLines: 1,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: HexColor('#354291'),fontSize: 10),)),
                                          //               ],
                                          //             ),
                                          //             SizedBox(height: 5,),
                                          //             InkWell(onTap: (){
                                          //               setState(() {
                                          //                 descTextShowFlag =!descTextShowFlag;
                                          //               });
                                          //               print('Taab $descTextShowFlag');
                                          //             },child: Text('Description')),
                                          //             vm3.documentList[index].description==null||descTextShowFlag==false?SizedBox():
                                          //             Container(width: 200,child: Text(vm3.documentList[index].description,maxLines: 2,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: HexColor('#354291'),fontSize: 10),)),
                                          //
                                          //             SizedBox(height: 5,),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //
                                          //       // Padding(
                                          //       //   padding: const EdgeInsets.only(right:18.0),
                                          //       //   child: Stack(children: [
                                          //       //     Container(width:45,child: dx),
                                          //       //     Padding(
                                          //       //       padding: const EdgeInsets.only(left:30.0),
                                          //       //       child: righticon,
                                          //       //     ),
                                          //       //   ]),
                                          //       // ),
                                          //       Padding(
                                          //         padding: const EdgeInsets.only(left: 10),
                                          //         child: Stack(children: [
                                          //           Padding(
                                          //             padding: const EdgeInsets.only(top:5.0,left: 30),
                                          //             child: Container(width:45,child: jp),
                                          //           ),
                                          //           // (controller3.isSelected(index))?
                                          //           // Padding(
                                          //           //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                          //           //   child: righticon,
                                          //           // ): (controller3.isSelecting)?
                                          //           // Padding(
                                          //           //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                          //           //   child: greyright,
                                          //           // ):
                                          //           // // Padding(
                                          //           // //   padding: EdgeInsets.only(left: 40,top: 10),
                                          //           // //   child: InkWell(onTap: () async{
                                          //           // //   await  vm6.deleteDocuments(accessToken: widget.accessToken,id:  vm3.documentList[index].id,attachmentName:  vm3.documentList[index].attachmentName,attachmentPath:  vm3.documentList[index].attachmentPath,attachmentTypeNo:  vm3.documentList[index].attachmentTypeNo,description:  vm3.documentList[index].description,activeStatus:  vm3.documentList[index].activeStatus,regId:  vm3.documentList[index].regId,type:  vm3.documentList[index].type,);
                                          //           // //   },child: Icon(Icons.delete)),
                                          //           // // ),
                                          //           Padding(
                                          //             padding: EdgeInsets.only(left: 90,top: 40),
                                          //             child: InkWell(onTap: () async{
                                          //               vm3.getData(accessToken: widget.accessToken,id: vm3.documentList[index].id,);
                                          //               _showAlertDialogForEditProfile(context,vm3.documentList[index].attachmentName);
                                          //
                                          //             },child: Icon(Icons.edit,color: HexColor('#354291'),)),
                                          //           ),
                                          //         ]),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          Container(

                                            height: isTablet
                                                ? 130 : deviceWidth<=360 ? 90
                                                : 100,
                                            margin: EdgeInsets.only(
                                                top: isTablet ? 8 : 8,
                                                bottom:
                                                isTablet ? 5 : 5,
                                                right: isTablet
                                                    ? 20
                                                    : 10,
                                                left: isTablet
                                                    ? 20
                                                    : 10),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  begin: Alignment
                                                      .bottomRight,
                                                  stops: [
                                                    1.0,
                                                    1.0
                                                  ],
                                                  colors: [
                                                    HexColor('#C5CAE8'),
                                                    HexColor('#E9ECFE'),
                                                  ]),
                                              //color: Colors.white,
                                              // border: Border.all(
                                              //   color: HexColor("#E9ECFE"),
                                              //   width: 1,
                                              // ),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  15),
                                            ),
                                            clipBehavior:
                                            Clip.antiAlias,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        alignment: Alignment.center,
                                                        child:  Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  8.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height:
                                                                    3,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                          width: isTablet? deviceWidth*.72 : deviceWidth <=
                                                                              330
                                                                              ? 140
                                                                              : 220,
                                                                          child:
                                                                          Text(
                                                                            vm3.documentList[index]?.attachmentName??'',
                                                                            maxLines:
                                                                            1,
                                                                            overflow:
                                                                            TextOverflow.ellipsis,
                                                                            style: GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.bold,
                                                                              color: HexColor('#354291'),
                                                                              fontSize:  isTablet
                                                                                  ? 15
                                                                                  : width <= 330
                                                                                  ? 10
                                                                                  : 12,),
                                                                          )),
                                                                      InkWell(onTap: () async{
                                                                        vm3.getData(accessToken: widget.accessToken,id: vm3.documentList[index].id,);
                                                                        _showAlertDialogForEditProfile(context,vm3.documentList[index].attachmentName);

                                                                      },child: Icon(Icons.edit,size:  isTablet? 25 :deviceWidth<=360? 18 : 20 ,color: HexColor('#354291'),)),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: isTablet? 3 : 1,
                                                                  ),
                                                                  Container(
                                                                    width: MediaQuery.of(context).size.width*.88,
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          // crossAxisAlignment:
                                                                          //     CrossAxisAlignment
                                                                          //         .start
                                                                          //,
                                                                          children: [
                                                                            Text(
                                                                              '${vm3.documentList[index].attachmentTypeName == null ? '' : vm3.documentList[index].attachmentTypeName}',
                                                                              maxLines:
                                                                              1,
                                                                              overflow:
                                                                              TextOverflow.ellipsis,
                                                                              style: GoogleFonts.poppins(
                                                                                  color: HexColor('#141D53'),
                                                                                  fontSize:  isTablet
                                                                                      ? 14
                                                                                      : width <= 330
                                                                                      ? 8
                                                                                      : 10,
                                                                                  fontWeight: FontWeight.w500),
                                                                            ),
                                                                            SizedBox(width: 10,),
                                                                            Text(
                                                                                vm3.documentList[index].reportDate==null?'${DateTime.now()}':'${DateUtil().formattedDate(DateTime.parse(vm3.documentList[index].reportDate).toLocal())}',
                                                                              style: GoogleFonts.poppins(
                                                                                  color: HexColor('#141D53'),
                                                                                  fontSize:  isTablet
                                                                                      ? 12
                                                                                      : width <= 330
                                                                                      ? 8
                                                                                      : 10,
                                                                                  fontWeight: FontWeight.w500),
                                                                            ),
                                                                            //SizedBox(width: 5,),
                                                                          ],
                                                                        ),
                                                                       Row(children: [
                                                                         Padding(
                                                                           padding: EdgeInsets.only(top: 0,right:0),
                                                                           child: InkWell(onTap: () async{
                                                                             await  downloadDocumentations(vm3.documentList[index].attachmentPath,vm3.documentList[index].attachmentName);

                                                                           },child: Icon(Icons.download_rounded,key: Key('documentationDownloadKey$index'),size:  isTablet? 25 :deviceWidth<=360? 18 : 20 ,color: AppTheme.appbarPrimary)),
                                                                         ),
                                                                         SizedBox(width: 5,),
                                                                         Padding(
                                                                           padding: EdgeInsets.only(top: 0,right: 8),
                                                                           child: GestureDetector(
                                                                               onTap: () async{
                                                                                 SVProgressHUD.show(
                                                                                     status: 'Please Wait'
                                                                                 );
                                                                                 await vm10.getData(fileNo: vm3.documentList[index].id);
                                                                                 await vm10.fileInfo(fileNo: vm3.documentList[index].id,regId: vm3.documentList[index].referenceNo);
                                                                                 SVProgressHUD.dismiss();
                                                                                 vm3.documentList[index].id==null?Fluttertoast.showToast(msg: 'No Documents Found'): showModalBottomSheet(
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
                                                                                                 heightFactor: 0.85,
                                                                                                 child:ShareDocument()
                                                                                             );
                                                                                           });
                                                                                     });
                                                                                 //print('CompanyName ${vm10.sharedFileList.last.companyName}');
                                                                               },
                                                                               // onTap: showNotification,
                                                                               child: Icon(Icons.share,key: Key('documentationShareKey$index'),size:  isTablet? 25 :deviceWidth<=360? 18 : 18 , color: AppTheme.appbarPrimary,)),
                                                                         ),
                                                                         SizedBox(width: 5,),
                                                                         InkWell(onTap: () {
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
                                                                               return Material(
                                                                                 type: MaterialType
                                                                                     .transparency,
                                                                                 child: Align(
                                                                                   alignment:
                                                                                   Alignment.center,
                                                                                   child: Material(
                                                                                     type: MaterialType
                                                                                         .transparency,
                                                                                     child: Stack(
                                                                                       children: [
                                                                                         Container(
                                                                                           height: 300,
                                                                                           width: isTablet?MediaQuery.of(context).size.width *.7 : MediaQuery.of(context).size.width,
                                                                                           child: Center(
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
                                                                                                 child: Column(
                                                                                                   children: [
                                                                                                     Column(
                                                                                                       mainAxisAlignment: MainAxisAlignment.center,
                                                                                                       crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                       children: [
                                                                                                         Padding(
                                                                                                           padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.08, right: MediaQuery.of(context).size.width*0.08),
                                                                                                           child: RichText(
                                                                                                             textAlign: TextAlign.center,
                                                                                                             text:  TextSpan(
                                                                                                               style:  GoogleFonts.poppins(
                                                                                                                 fontSize: isTablet? 18 : 14.0,
                                                                                                                 color: Colors.black,
                                                                                                               ),
                                                                                                               children: <TextSpan>[
                                                                                                                 TextSpan(text: 'Are you '),
                                                                                                                  TextSpan(text: 'sure', style: GoogleFonts.poppins()),
                                                                                                                 TextSpan(text: " you want to Delete?", style: GoogleFonts.poppins()),
                                                                                                               ],
                                                                                                             ),
                                                                                                           ),
                                                                                                         ),
                                                                                                       ],
                                                                                                     ),
                                                                                                     // Column(
                                                                                                     //   children: [
                                                                                                     //     Row(
                                                                                                     //       mainAxisAlignment: MainAxisAlignment.center,
                                                                                                     //       children: [
                                                                                                     //         Text("Remove ", style: GoogleFonts.poppins()),
                                                                                                     //         Text(familyVm.familyMembersList[index].fmName,style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
                                                                                                     //         Text(" from", style: GoogleFonts.poppins())
                                                                                                     //       ],
                                                                                                     //     ),
                                                                                                     //     Text("your members list.", style: GoogleFonts.poppins())
                                                                                                     //   ],
                                                                                                     // ),
                                                                                                     SizedBox(
                                                                                                       height: 5,
                                                                                                     ),
                                                                                                     SizedBox(
                                                                                                       height: isTablet? 10 : MediaQuery.of(context).size.width<=330 ? 10 : 20,
                                                                                                     ),
                                                                                                     Padding(
                                                                                                       padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*.08, right: MediaQuery.of(context).size.width*0.08),
                                                                                                       child: Row(
                                                                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                         children: [
                                                                                                           Padding(
                                                                                                             padding: const EdgeInsets.only(left: 0.0, right: 0),
                                                                                                             child: Container(
                                                                                                               width: isTablet? MediaQuery.of(context).size.width*.22: MediaQuery.of(context).size.width/3,
                                                                                                               decoration: BoxDecoration(),
                                                                                                               height: isTablet? 50 : 45,
                                                                                                               child: FlatButton(
                                                                                                                   key: Key('familyMemberCancelButtonKey'),
                                                                                                                   onPressed: (){
                                                                                                                     Navigator.pop(context);
                                                                                                                   },
                                                                                                                   shape: RoundedRectangleBorder(
                                                                                                                       side: BorderSide(
                                                                                                                           color: AppTheme.appbarPrimary
                                                                                                                           ,width: 1),
                                                                                                                       borderRadius: BorderRadius.circular(10)),
                                                                                                                   textColor: AppTheme.appbarPrimary ,
                                                                                                                   color: Colors.white ,child: Text("Cancel",style: GoogleFonts.poppins(fontSize: isTablet? 18 : 15))),
                                                                                                             ),
                                                                                                           ),
                                                                                                           Padding(
                                                                                                             padding: const EdgeInsets.only(left: 0.0, right: 0),
                                                                                                             child: Container(
                                                                                                               width: isTablet? MediaQuery.of(context).size.width*.22: MediaQuery.of(context).size.width/3,
                                                                                                               height: isTablet? 50 : 45,
                                                                                                               child: FlatButton(
                                                                                                                   key: Key('familyMemberRemoveButtonKey'),
                                                                                                                   onPressed: () async{
                                                                                                                         // vm3.getData(accessToken: widget.accessToken,id: vm3.documentList[index].id,);
                                                                                                                         // _showAlertDialogForEditProfile(context,vm3.documentList[index].attachmentName);
                                                                                                                         SVProgressHUD.show(
                                                                                                                             status: 'Deleting'
                                                                                                                         );
                                                                                                                         await Provider.of<UploadDocumentsViewModel>(context, listen: false)
                                                                                                                             .deleteDocuments(accessToken: accessTokenVm.accessToken,id:vm3.documentList[index].id,attachmentName:vm3.documentList[index].attachmentName,attachmentPath:vm3.documentList[index].attachmentPath,attachmentTypeNo: vm3.documentList[index].attachmentTypeNo,description: vm3.documentList[index].description,activeStatus: vm3.documentList[index].activeStatus,referenceNo: vm3.documentList[index].referenceNo,referenceTypeNo: vm3.documentList[index].referenceTypeNo,regId: vm3.documentList[index].regId,type: vm3.documentList[index].type ).then((value){
                                                                                                                           setState(() {
                                                                                                                             vm3.getDataforDoc();
                                                                                                                           });
                                                                                                                         });
                                                                                                                         SVProgressHUD.dismiss();
                                                                                                                         Navigator.pop(context);
                                                                                                                   },
                                                                                                                   shape: RoundedRectangleBorder(
                                                                                                                       borderRadius: BorderRadius.circular(10)),
                                                                                                                   textColor: Colors.white,
                                                                                                                   color: AppTheme.appbarPrimary ,child: Text("Delete",  style: GoogleFonts.poppins(fontSize: isTablet? 18 : 15))),
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
                                                                                         Positioned(
                                                                                           bottom: 185,
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
                                                                                                   "assets/images/deletewaring.png",height: 90,width: 90,)),
                                                                                           ),
                                                                                         ),
                                                                                       ],
                                                                                     ),
                                                                                   ),
                                                                                 ),
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

                                                                         },child: Icon(Icons.delete,size:  isTablet? 25 :deviceWidth<=360? 18 : 20 ,color: HexColor('#354291'),)),

                                                                       ],)
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            // Row(
                                                            //   children: [
                                                            //     Row(
                                                            //         children: [
                                                            //           // Padding(
                                                            //           //   padding: const EdgeInsets.only(top:5.0,left: 30),
                                                            //           //   child: Container(width:45,child: jp),
                                                            //           // ),
                                                            //           // (controller3.isSelected(index))?
                                                            //           // Padding(
                                                            //           //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                                            //           //   child: righticon,
                                                            //           // ): (controller3.isSelecting)?
                                                            //           // Padding(
                                                            //           //   padding: const EdgeInsets.only(left:38.0,top: 10),
                                                            //           //   child: greyright,
                                                            //           // ):
                                                            //           // // Padding(
                                                            //           // //   padding: EdgeInsets.only(left: 40,top: 10),
                                                            //           // //   child: InkWell(onTap: () async{
                                                            //           // //   await  vm6.deleteDocuments(accessToken: widget.accessToken,id:  vm3.documentList[index].id,attachmentName:  vm3.documentList[index].attachmentName,attachmentPath:  vm3.documentList[index].attachmentPath,attachmentTypeNo:  vm3.documentList[index].attachmentTypeNo,description:  vm3.documentList[index].description,activeStatus:  vm3.documentList[index].activeStatus,regId:  vm3.documentList[index].regId,type:  vm3.documentList[index].type,);
                                                            //           // //   },child: Icon(Icons.delete)),
                                                            //           // // ),
                                                            //
                                                            //
                                                            //
                                                            //
                                                            //
                                                            //
                                                            //         ]),
                                                            //   ],)

                                                                    //SizedBox(height: 5,),
                                                                    // InkWell(onTap: (){
                                                                    //   setState(() {
                                                                    //     descTextShowFlag =!descTextShowFlag;
                                                                    //   });
                                                                    //   print('Taab $descTextShowFlag');
                                                                    // },child: Text('Description')),
                                                                    // vm3.documentList[index].description==null||descTextShowFlag==false?SizedBox():
                                                                    // Container(width: 200,child: Text(vm3.documentList[index].description,maxLines: 2,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins(color: HexColor('#354291'),fontSize: 10),)),

                                                                    // SizedBox(height: 5,),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child: Container(
                                                                    alignment: Alignment.center,
                                                                    child: Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        children: [
                                                                          SizedBox(
                                                                            height: 5,
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets
                                                                                        .only(
                                                                                    left: 8.0),
                                                                            child: Text(
                                                                              'Description',
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow
                                                                                  .ellipsis,
                                                                              style: GoogleFonts
                                                                                  .poppins(
                                                                                fontWeight:
                                                                                    FontWeight.bold,
                                                                                color: HexColor(
                                                                                    '#354291'),
                                                                                fontSize: isTablet
                                                                                    ? 15
                                                                                    : width <= 330
                                                                                        ? 10
                                                                                        : 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding:
                                                                                const EdgeInsets
                                                                                    .only(
                                                                              left: 8.0,
                                                                              right: 8,
                                                                              bottom: 5,
                                                                            ),
                                                                            child: Column(
                                                                              crossAxisAlignment:
                                                                                  CrossAxisAlignment
                                                                                      .start,
                                                                              children: <Widget>[
                                                                                //for (var _ in Iterable.generate(5))
                                                                                Container(
                                                                                  width: 220,
                                                                                  child: Text(
                                                                                    vm3.documentList[index].description ==
                                                                                            null
                                                                                        ? "No Description Found!"
                                                                                        : vm3
                                                                                            .documentList[
                                                                                                index]
                                                                                            .description,
                                                                                    softWrap: true,
                                                                                    overflow:
                                                                                        TextOverflow
                                                                                            .ellipsis,
                                                                                    maxLines: 1,
                                                                                    style:
                                                                                        GoogleFonts
                                                                                            .poppins(
                                                                                      fontSize: isTablet
                                                                                          ? 15
                                                                                          : width <= 330
                                                                                              ? 8
                                                                                              : 12,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ]))),
                                                          ],
                                                        ),

                                                        // vm3.documentList[index]
                                                        //             .description ==
                                                        //         null
                                                        //     ? SizedBox()
                                                        //     : Padding(
                                                        //         padding:
                                                        //             const EdgeInsets
                                                        //                     .only(
                                                        //                 right:
                                                        //                     10.0,
                                                        //                 left:
                                                        //                     10),
                                                        //         child: Divider(
                                                        //           thickness: 1,
                                                        //         ),
                                                        //       ),
                                                        // vm3.documentList[index]
                                                        //             .description ==
                                                        //         null
                                                        //     ? SizedBox()
                                                        //     : ScrollOnExpand(
                                                        //         scrollOnExpand:
                                                        //             true,
                                                        //         scrollOnCollapse:
                                                        //             false,
                                                        //         child:
                                                        //             ExpandablePanel(
                                                        //           theme:
                                                        //               ExpandableThemeData(
                                                        //             headerAlignment:
                                                        //                 ExpandablePanelHeaderAlignment
                                                        //                     .center,
                                                        //             tapBodyToCollapse:
                                                        //                 true,
                                                        //           ),
                                                        //           header: Padding(
                                                        //               padding: EdgeInsets.all(10),
                                                        //               child: Text(
                                                        //                 "Description",
                                                        //                 style: GoogleFonts.poppins(
                                                        //                     color: HexColor(
                                                        //                         '#141D53'),
                                                        //                     fontSize:
                                                        //                     isTablet
                                                        //                         ? 14
                                                        //                         : width <= 330
                                                        //                         ? 8
                                                        //                         : 10,
                                                        //                     fontWeight:
                                                        //                         FontWeight.w500),
                                                        //               )),
                                                        //           // collapsed: Text(
                                                        //           //   vm3.documentList[index].description==null?"":vm3.documentList[index].description,
                                                        //           //   softWrap: true,
                                                        //           //   maxLines: 2,
                                                        //           //   overflow: TextOverflow.ellipsis,
                                                        //           // ),
                                                        //           expanded:
                                                        //               Container(
                                                        //             decoration:
                                                        //                 BoxDecoration(
                                                        //               color: Colors
                                                        //                   .white,
                                                        //               borderRadius:
                                                        //                   BorderRadius.circular(
                                                        //                       15),
                                                        //             ),
                                                        //             width: double
                                                        //                 .infinity,
                                                        //             child:
                                                        //                 Padding(
                                                        //               padding:
                                                        //                   const EdgeInsets.all(
                                                        //                       8.0),
                                                        //               child:
                                                        //                   Column(
                                                        //                 crossAxisAlignment:
                                                        //                     CrossAxisAlignment.start,
                                                        //                 children: <
                                                        //                     Widget>[
                                                        //                   //for (var _ in Iterable.generate(5))
                                                        //                   Text(
                                                        //                     vm3.documentList[index].description == null
                                                        //                         ? ""
                                                        //                         : vm3.documentList[index].description,
                                                        //                     softWrap:
                                                        //                         true,
                                                        //                     overflow:
                                                        //                         TextOverflow.fade,
                                                        //                     style: GoogleFonts.poppins( fontSize: isTablet
                                                        //                         ? 15
                                                        //                         : width <= 330
                                                        //                         ? 8
                                                        //                         : 12,),
                                                        //                   ),
                                                        //                 ],
                                                        //               ),
                                                        //             ),
                                                        //           ),
                                                        //           builder: (_,
                                                        //               collapsed,
                                                        //               expanded) {
                                                        //             return Padding(
                                                        //               padding: EdgeInsets.only(
                                                        //                   left:
                                                        //                       10,
                                                        //                   right:
                                                        //                       10,
                                                        //                   bottom:
                                                        //                       10),
                                                        //               child:
                                                        //                   Expandable(
                                                        //                 collapsed:
                                                        //                     collapsed,
                                                        //                 expanded:
                                                        //                     expanded,
                                                        //                 theme: const ExpandableThemeData(
                                                        //                     crossFadePoint:
                                                        //                         0),
                                                        //               ),
                                                        //             );
                                                        //           },
                                                        //         ),
                                                        //       ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            );
                                          }),
                            ),
                          ],
                        ),
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

  void _showAlertDialogForEditProfile(BuildContext context, String docName) {
    showDialog(
        context: context,
        builder: (context) {
          return EditDocAlert(
            docName: docName,
          );
        }).then((value) {
      setState(() {});
    });
  }
}

class DateUtil {
  static const DATE_FORMAT = 'dd/MM/yyyy   hh:mm a';

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}
