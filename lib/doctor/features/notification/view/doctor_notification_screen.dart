import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DoctorNotificationScreen extends StatefulWidget {
  const DoctorNotificationScreen({Key key}) : super(key: key);

  @override
  _DoctorNotificationScreenState createState() => _DoctorNotificationScreenState();
}

class _DoctorNotificationScreenState extends State<DoctorNotificationScreen> {
  var markAsRead= Align(
    alignment: Alignment.topRight,
    child: Material(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: HexColor('#141D53'),
      //color: Colors.black,
      child: SizedBox(
        height: 30,
        width: 110,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Mark all as read",
              style: TextStyle(color: HexColor('#FFFFFF'),fontWeight: FontWeight.bold,fontSize: 12),
            ),
          ),
        ),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    var notificationListTile=ListTile(
      title: Text("You have an appointment today!",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: HexColor('#8592E5')),),
      subtitle:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: RichText(text: TextSpan(
              children: [
                TextSpan(
                    text: "Rahim,You have an appointment today with Dr.Jahid Hasan at ",
                    style: TextStyle(fontSize: 10,color: Colors.black)
                ),
                TextSpan(
                    text: '8:30 pm.',
                    style: TextStyle(fontSize: 10,color: HexColor('#8592E5'),fontWeight: FontWeight.w500)
                ),
              ],
            )),
          ),
          //SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("5 hours ago",style: TextStyle(fontSize: 10,color: HexColor('#D2D2D2')),),
          ),
        ],
      ) ,
    );
    var notificationListTiledefault=ListTile(
      title: Text("You have an appointment today!",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(0.5)),),
      subtitle:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rahim,You have an appointment today with Dr.Jahid Hasan at 8:30 pm",style: TextStyle(fontSize: 10,color: Colors.grey.withOpacity(0.5)),),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: Text("5 hours ago",style: TextStyle(fontSize: 10,color: Colors.grey.withOpacity(0.5)),),
          ),
        ],
      ) ,
    );
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
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              markAsRead,
              notificationListTile,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTile,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
              Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.grey.withOpacity(0.2),
              ),
              notificationListTiledefault,
            ],
          ),
        ),
      ),
    );
  }
}
