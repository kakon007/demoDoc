import 'package:flutter/material.dart';
import 'package:myhealthbd_app/demo_doctor/view/write_prescription.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';

class DoctorWorklistHistory extends StatefulWidget {

  @override
  _DoctorWorklistHistoryState createState() => _DoctorWorklistHistoryState();
}

class _DoctorWorklistHistoryState extends State<DoctorWorklistHistory> {


  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    var todayWorklist=Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xff7266D8),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Patient Name: Jahid Hasan Kakon',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 10,),
                  Text('Patient Serial: 01',style: TextStyle(color: Colors.white,fontSize: 15),),
                  SizedBox(height: 10,),
                  Text('Patient Disease: Unknown',style: TextStyle(color: Colors.white,fontSize: 15),),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WritePrescription()));
                },
                child: Material(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(5)),
                  color: Colors.white,
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight:40,
                      maxWidth:100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:18.0),
                      child: Column(
                        children: [
                          Icon(Icons.add_circle_outline),
                          Text(
                            "Write Prescription For Patient",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: isTablet
                                    ? 15
                                    : MediaQuery.of(context).size.width <=
                                    360 &&
                                    MediaQuery.of(context).size.width >
                                        330
                                    ? 9
                                    : MediaQuery.of(context).size.width <=
                                    330
                                    ? 8
                                    : 11,
                                fontWeight:
                                FontWeight.w500),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: Colors.black)),
        backgroundColor:Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView.separated(itemCount: 10,itemBuilder: (context,index){
          return todayWorklist;
        },separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 10,
          );}),
      ),
    );
  }
}
