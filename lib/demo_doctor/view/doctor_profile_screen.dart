import 'package:flutter/material.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var imageDashboard = Padding(
        padding: EdgeInsets.only(right: 15),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 1)),
            height: width <= 330 ? 50 : 50,
            width: width <= 330 ? 50 : 50,
            child: Center(
              child: Image.asset(
                'assets/icons/dct.png',
                height: width <= 330 ? 25 : 25,
                width: width <= 330 ? 25 : 25,
              ),
            )));
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xff7266D8),
            child: Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 80),
                        child: InkWell(onTap: (){
                          Navigator.pop(context);
                        },child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
                      ),
                      SizedBox(width:140,),
                      imageDashboard,
                    ],
                  ),
                  Text(
                    'Dr.Anaf Hossain',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Therapist',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1)),
                        height: width <= 330 ? 45 : 45,
                        width: width <= 330 ? 45 : 45,
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1)),
                        height: width <= 330 ? 45 : 45,
                        width: width <= 330 ? 45 : 45,
                        child: Icon(
                          Icons.chat_bubble,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About Doctor',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Dr.Anaf Hossain is An Experienced specialist who is constantly working on improving her skills.',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1)),
                        height: width <= 330 ? 45 : 45,
                        width: width <= 330 ? 45 : 45,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        'Block-C,Bashundhara R/A,Dhaka',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                    ],),

                    SizedBox(
                      height: 15,
                    ),

                    Text(
                      'Reviews',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                     // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Row(
                            children: [
                              Text(
                                'Jahid Hasan',
                                style: TextStyle(color: Colors.black, fontSize: 13),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  Icon(Icons.star,color: Colors.amberAccent,),
                                  Icon(Icons.star,color: Colors.amberAccent,),
                                  Icon(Icons.star,color: Colors.amberAccent,),
                                  Icon(Icons.star,color: Colors.amberAccent,),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Text(
                            '1 Day ago',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 15,),
                          Text(
                            'Many Thanks to Dr. Anaf Hossain.He is Professional,Copetent Doctor.....',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 30, top: 100, right: 30, bottom: 50),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff7266D8),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Center(
                          child: Text(
                            'Book Appointment',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
