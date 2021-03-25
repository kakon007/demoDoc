import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/prescription_list.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/report_list.dart';
import 'package:myhealthbd_app/features/my_health/view/widgets/report_screen.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:unicorndial/unicorndial.dart';

class PrescriptionListScreen extends StatefulWidget {
  @override
  _PrescriptionListScreenState createState() => _PrescriptionListScreenState();
}

class _PrescriptionListScreenState extends State<PrescriptionListScreen> {

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
  List<PrescriptionList> pescriptionList = [
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),
    PrescriptionList(
        consultNo:  'Consultation No:C921334527',
        day: 'Monday 25-01-2021 05:41 PM    23 Day ago',
        docName: 'Dr. Zia Uddin Arman',
        hosName: 'Apollo Hospital Bangladesh'),

  ];

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
  MultiSelectController controller = new MultiSelectController();
  MultiSelectController controller2 = new MultiSelectController();
  void initState() {
    super.initState();
    controller.disableEditingWhenNoneSelected = true;
    controller.set(pescriptionList.length);
    controller2.set(reportList.length);
  }

  void delete() {
    var list = controller.selectedIndexes;
    var list2 = controller2.selectedIndexes;
    list.sort((b, a) =>
        a.compareTo(b)); //reoder from biggest number, so it wont error
    list2.sort((b, a) =>
        a.compareTo(b));
    list.forEach((element) {
      pescriptionList.removeAt(element);
      reportList.removeAt(element);
    });

    setState(() {
      controller.set(pescriptionList.length);
      controller2.set(reportList.length);
    });
  }

  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }
  @override
  Widget build(BuildContext context) {
    var childButtons = List<UnicornButton>();

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelText: "Choo choo",
        currentButton: FloatingActionButton(
          heroTag: "train",
          backgroundColor: Colors.redAccent,
          mini: true,
          child: Icon(Icons.train),
          onPressed: () {},
        )));

    childButtons.add(UnicornButton(
        currentButton: FloatingActionButton(
            heroTag: "airplane",
            backgroundColor: Colors.greenAccent,
            mini: true,
            child: Icon(Icons.airplanemode_active))));

    childButtons.add(UnicornButton(
        currentButton: FloatingActionButton(
            heroTag: "directions",
            backgroundColor: Colors.blueAccent,
            mini: true,
            child: Icon(Icons.directions_car))));


    final String assetName4 = "assets/images/dx.svg";
    final String assetName2="assets/icons/right.svg";
    final String assetName7="assets/icons/greyright.svg";
    final String assetName5="assets/icons/pp.svg";

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
      height:100,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    void handleClick(String value) {
      switch (value) {
        case 'Share':
          break;
        case 'Download':
          break;
        case 'Delete':
          break;
      }
    }
    var popup= Padding(
      padding: EdgeInsets.only(bottom: 60,right: 1),
      child: Container(
        //margin: EdgeInsets.only(bottom: 60,),
        width: 25,
        height: 25,
        child: PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Share', 'Download','Delete'}.map((String choice) {
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
    var height = MediaQuery.of(context).size.height;
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
          child: Stack(
              children:[
                Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.search_outlined,size: 25,), onPressed: null)),
                TextFormField(
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
                  ),
                  onChanged: (text) {
                    //value = text;
                  },
                ),
              ]
          ),
        )
    );
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: HexColor('#354291'),
          title: Text('Patient Portal',style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w500),),
          actions: (controller.isSelecting || controller2.isSelecting)
              ? <Widget>[
            Row(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                        width: 18,
                        height: 18,
                        child:Image.asset('assets/icons/slt.png')),
                  ),
                  SizedBox(width: 15,),
                  GestureDetector(
                    onTap: (){delete();},
                    child: Container(
                        width: 18,
                        height: 18,
                        child:Image.asset('assets/icons/dlt.png')),
                  ),
                  SizedBox(width: 15,),
                  GestureDetector(
                    child: Container(
                        width: 18,
                        height: 18,
                        child:Image.asset('assets/icons/sh.png')),
                  ),
                  SizedBox(width: 15,),
                  GestureDetector(
                    child: Container(
                        width: 18,
                        height: 18,
                        child:Image.asset('assets/icons/dwn.png')),
                  ),
                  SizedBox(width: 15,),
                ],
              ),
          ]
              : <Widget>[
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
            leading: new IconButton(
                icon: new Icon(Icons.notes),
                onPressed: () => _scaffoldKey.currentState.openDrawer()),
        ),
        drawer: Drawer(),
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
                        child: Center(child: Text('Reports',style: GoogleFonts.poppins(color: HexColor('#354291'),fontWeight: FontWeight.w500),)),
                      ),
                       Container(
                        height: 40,
                        //width: 30.0,
                        child:Center(child: Text('Documents',style: GoogleFonts.poppins(color: HexColor('#354291'),fontWeight: FontWeight.w500),)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    WillPopScope(
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
                padding: const EdgeInsets.only(left:12.0,bottom: 20),
                child: Text("33 Prescription(s) found",style: GoogleFonts.poppins(fontSize: 10),),
              ),
              Spacer(),
              searchField,
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: ListView.builder( physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount:pescriptionList.length,
                  itemBuilder: (BuildContext context, int index) {
                      return MultiSelectItem(
                        isSelecting: controller.isSelecting,
                        onSelected: () {
                          setState(() {
                            controller.toggle(index);
                          });
                        },
                        child: Stack(
                            children:[
                              Container(

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
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0),
                                      child: CircleAvatar(
                                        radius: 31,
                                        backgroundColor: HexColor('#354291').withOpacity(0.2),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.white,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage('assets/images/proimg.png'),
                                            radius: 28,
                                          ),
                                        ),
                                      ),
                                    ),
                                    //SizedBox(width: 5,),
                                    Padding(
                                      padding: const EdgeInsets.only(top:8.0,right: 8,bottom: 8,left: 6),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 8,),
                                          Text(pescriptionList[index].consultNo,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#354291'),fontSize: 12),),
                                          Text(pescriptionList[index].day,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w500),),
                                          SizedBox(height: 5,),
                                          Text(pescriptionList[index].docName,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 12,fontWeight: FontWeight.w600)),
                                          Text(pescriptionList[index].hosName,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w600))
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
                                      padding: const EdgeInsets.only(right:18.0),
                                      child: Stack(children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top:10.0),
                                          child: Container(width:45,child: rx),
                                        ),
                                         (controller.isSelected(index))?
                                        Padding(
                                          padding: const EdgeInsets.only(left:38.0,top: 5),
                                          child: righticon,
                                        ): (controller.isSelecting)?Padding(
                                           padding: const EdgeInsets.only(left:38.0,top: 5),
                                           child: greyright,
                                         ):Padding(
                                           padding: EdgeInsets.only(left: 38,top: 5),
                                           child: popup,
                                         ),
                                      ]),
                                    ),


                                  ],
                                ),
                              ),
                            ]
                        ),
                      );
                  }),
            ),
          ),
          ],
        )

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
                          body:

                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:12.0,bottom: 20),
                                    child: Text("13 Report(s) found",style: GoogleFonts.poppins(fontSize: 10),),
                                  ),
                                  Spacer(),
                                  searchField,
                                ],
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                    physics: ScrollPhysics(),
                                    child: Column(
                                      children: [
                                    ListView.builder( physics: NeverScrollableScrollPhysics(),
                                        itemCount:reportList.length,
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
                                              Container(

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
                                                          Text(reportList[index].reportName,style: GoogleFonts.poppins(fontWeight: FontWeight.bold,color: HexColor('#354291'),fontSize: 12),),
                                                          Text(reportList[index].day,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 10,fontWeight: FontWeight.w500),),
                                                          SizedBox(height: 8,),
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                radius: 18,
                                                                backgroundColor: HexColor('#354291').withOpacity(0.2),
                                                                child: CircleAvatar(
                                                                  backgroundColor: Colors.white,
                                                                  backgroundImage: AssetImage('assets/images/ap.png'),
                                                                  radius: 17,
                                                                ),
                                                              ),
                                                              SizedBox(width: 15,),
                                                              Text(reportList[index].hosName,style: GoogleFonts.poppins(color: HexColor('#141D53'),fontSize: 12,fontWeight: FontWeight.w500)),
                                                            ],
                                                          )
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
                                                        (controller2.isSelected(index))?
                                                        Padding(
                                                          padding: const EdgeInsets.only(left:38.0,top: 10),
                                                          child: righticon,
                                                        ): (controller2.isSelecting)?Padding(
                                                          padding: const EdgeInsets.only(left:38.0,top: 10),
                                                          child: greyright,
                                                        ):Padding(
                                                          padding: EdgeInsets.only(left: 38),
                                                          child: popup,
                                                        ),
                                                      ]),
                                                    ),
                                                  ],
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
                   Scaffold(
                     floatingActionButton: Padding(
                       padding: const EdgeInsets.only(bottom:10.0,right: 10),
                       child: UnicornDialer(
                           backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
                           parentButtonBackground: HexColor('#8592E5'),
                           orientation: UnicornOrientation.VERTICAL,
                           parentButton: Icon(Icons.add),
                           childButtons: childButtons),
                     ),
                     body: Align(
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
}
