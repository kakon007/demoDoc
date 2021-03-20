import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    var notificationListTile=ListTile(
      title: Text("You have an appointment today!",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: HexColor('#8592E5')),),
      subtitle:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: "Rahim,You have an appointment today with Dr.Jahid Hasan at ",
                  style: TextStyle(fontSize: 10,color: Colors.black,fontWeight: FontWeight.w500)
              ),
              TextSpan(
                text: '8:30 pm.',
                  style: TextStyle(fontSize: 10,color: HexColor('#8592E5'),fontWeight: FontWeight.w500)
              ),
            ],
          )),
          SizedBox(height: 8,),
          Text("5 hours ago",style: TextStyle(fontSize: 10,color: Colors.grey.withOpacity(0.5)),),
        ],
      ) ,
    );
    var notificationListTiledefault=ListTile(
      title: Text("You have an appointment today!",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.grey.withOpacity(0.5)),),
      subtitle:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rahim,You have an appointment today with Dr.Jahid Hasan at 8:30 pm",style: TextStyle(fontSize: 10,color: Colors.grey.withOpacity(0.5)),),
          SizedBox(height: 8,),
          Text("5 hours ago",style: TextStyle(fontSize: 10,color: Colors.grey.withOpacity(0.5)),),
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
               color: Colors.black,
         ),
       ),
       title: Padding(
         padding: const EdgeInsets.only(left:50.0),
         child: Center(child: Text("Notifications",style: TextStyle(color:Colors.black,fontSize: 20),)),
       ),
       backgroundColor: Colors.transparent,
       elevation: 0.0,
       actions: [
         Padding(
           padding: const EdgeInsets.only(top:12.0,bottom: 12,right: 8),
           child: Material(
             elevation: 0,
             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
             // color: HexColor('#8592E5'),
             color: Colors.black,
             child: SizedBox(
               height: 50,
               width: 120,
               child: Center(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(
                     "Mark all as read",
                     style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),
                   ),
                 ),
               ),
             ),
           ),
         ),
       ],
     ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              notificationListTile,
              Divider(
               // height: 0.2,
                thickness: 1.5,
              ),
              notificationListTile,
              Divider(
                //height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
              Divider(
               // height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
              Divider(
              //  height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
              Divider(
                //height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
              Divider(
                //height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
              Divider(
                //height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
              Divider(
                //height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
              Divider(
                //height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
              Divider(
                //height: 0.2,
                thickness: 1.5,
              ),
              notificationListTiledefault,
            ],
          ),
        ),
      ),
    );
  }
}
