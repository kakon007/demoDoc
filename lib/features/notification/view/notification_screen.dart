import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/notification/view_model/notification_view_model.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // var markAsRead= Align(
  //   alignment: Alignment.topRight,
  //     child: Material(
  //       elevation: 0,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //       color: HexColor('#141D53'),
  //       //color: Colors.black,
  //       child: SizedBox(
  //         height: 30,
  //         width: 110,
  //         child: Center(
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Text(
  //               "Mark all as read",
  //               style: TextStyle(color: HexColor('#FFFFFF'),fontWeight: FontWeight.bold,fontSize: 12),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );


  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  getToken()async{
    // // (iOS Only) Need requesting permission of Push Notification.
    // if (Platform.isIOS) {
    //   plainNotificationToken.requestPermission();
    //
    //   // If you want to wait until Permission dialog close,
    //   // you need wait changing setting registered.
    //   await plainNotificationToken.onIosSettingsRegistered.first;
    // }

    String token = await _firebaseMessaging.getToken();
    print("TokenfcmFromNo"+token);
    return token;
  }
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async {
      var vm = Provider.of<NotificationViewModel>(context, listen: false);
      await vm.getData(deviceToken: await getToken()).then((value) {
        setState(() {
          vm.getData();
        });
      });
    });
    print('ONes');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var vm = appNavigator.getProviderListener<NotificationViewModel>();
    // var notificationListTile=ListTile(
    //   title: Text("You have an appointment today!",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: HexColor('#8592E5')),),
    //   subtitle:Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.only(top:5.0),
    //         child: RichText(text: TextSpan(
    //           children: [
    //             TextSpan(
    //               text: "Rahim,You have an appointment today with Dr.Jahid Hasan at ",
    //                 style: TextStyle(fontSize: 10,color: Colors.black)
    //             ),
    //             TextSpan(
    //               text: '8:30 pm.',
    //                 style: TextStyle(fontSize: 10,color: HexColor('#8592E5'),fontWeight: FontWeight.w500)
    //             ),
    //           ],
    //         )),
    //       ),
    //       //SizedBox(height: 8,),
    //       Padding(
    //         padding: const EdgeInsets.only(top:8.0),
    //         child: Text("5 hours ago",style: TextStyle(fontSize: 10,color: HexColor('#D2D2D2')),),
    //       ),
    //     ],
    //   ) ,
    // );
    // var notificationListTiledefault=ListTile(
    //   title: Text("You have an appointment today!",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(0.5)),),
    //   subtitle:Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Text("Rahim,You have an appointment today with Dr.Jahid Hasan at 8:30 pm",style: TextStyle(fontSize: 10,color: Colors.grey.withOpacity(0.5)),),
    //       SizedBox(height: 5,),
    //       Padding(
    //         padding: const EdgeInsets.only(top:8.0),
    //         child: Text("5 hours ago",style: TextStyle(fontSize: 10,color: Colors.grey.withOpacity(0.5)),),
    //       ),
    //     ],
    //   ) ,
    // );
    return Scaffold(
     appBar: AppBar(
       automaticallyImplyLeading: false,
       leading: GestureDetector(
         onTap: (){
           Navigator.pop(context);
         },
         child: Icon(
           Icons.arrow_back_outlined,
               color: Colors.white,
         ),
       ),
       title:  Text("Notifications",style: TextStyle(color:Colors.white,fontSize: 15),),

       backgroundColor: HexColor('#354291'),
       //elevation: 0.0,
     ),
      body:Padding(
        padding: const EdgeInsets.all(15.0),
        child:vm.notificationList.length == 0
            ? Align(
          alignment: Alignment.center,
          child: Container(
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.center,
              crossAxisAlignment:
              CrossAxisAlignment.center,
              children: [
                // pp,
                // SizedBox(
                //   height: isTablet ? 20 : 10,
                // ),
                Text(
                  'You have no notification yet',
                  style: GoogleFonts.poppins(
                      color: HexColor('#AEB0BA'),
                      fontWeight: FontWeight.w400,
                      fontSize: isTablet ? 22 : 16),
                ),
              ],
            ),
          ),
        ):ListView.separated(
            key: Key('listViewBuilderKey33'),
            shrinkWrap: true,
            itemCount: vm.notificationList.length,
            itemBuilder: (BuildContext context, int index) {
              print('Jahidsf');
              // int logoIndex = vm5.hospitalLogoList.indexWhere((element) => element.id==hospitalItems2[index].id);
              // int imageIndex = vm6.hospitalImageList.indexWhere((element) => element.id==hospitalItems2[index].id);
              return ListTile(
                    title: Text(vm.notificationList[index].messageTitle,style: TextStyle(fontSize: isTablet ? 15:12,fontWeight: FontWeight.bold,color: HexColor('#8592E5')),),
                    subtitle:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:5.0),
                          child: RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                text: vm.notificationList[index].messageBody,
                                  style: TextStyle(fontSize: isTablet ? 13:10,color: Colors.black)
                              ),
                              // TextSpan(
                              //   text: '8:30 pm.',
                              //     style: TextStyle(fontSize: 10,color: HexColor('#8592E5'),fontWeight: FontWeight.w500)
                              // ),
                            ],
                          )),
                        ),
                        //SizedBox(height: 8,),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text(DateUtil().formattedDate(DateTime.parse(vm
                              .notificationList[index]
                              .sendDate)
                              .toLocal()),style: TextStyle(fontSize: isTablet ? 13:10,color: HexColor('#D2D2D2')),),
                        ),
                      ],
                    ) ,
                  );

            },separatorBuilder: (context, index) {
          return Divider();
        },),
      ),
    );
  }
}


class DateUtil {
  static const DATE_FORMAT = 'yyyy-MM-dd';

  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}