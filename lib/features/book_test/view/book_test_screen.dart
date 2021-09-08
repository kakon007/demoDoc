import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/features/book_test/view/booking_summery_screen.dart';
import 'package:myhealthbd_app/features/book_test/view_model/test_item_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:provider/provider.dart';

class BookTestScreen extends StatefulWidget {
  const BookTestScreen({Key key}) : super(key: key);

  @override
  _BookTestScreenState createState() => _BookTestScreenState();
}

class _BookTestScreenState extends State<BookTestScreen> {
  final double itemHeight = (442 - kToolbarHeight - 24) / 3;
  final double itemWidth = 200 / 2;
  @override
  void initState() {
   var vm= Provider.of<TestItemViewModel>(context, listen: false);
   vm.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var testItemVm = Provider.of<TestItemViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Test"),
        backgroundColor: AppTheme.appbarPrimary,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingSummeryScreen(),
                    ));
              },
              child: Icon(Icons.shopping_cart_rounded),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 150,
              maxCrossAxisExtent: 300,
              childAspectRatio: (itemWidth / itemHeight),
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemCount: testItemVm.testItemList.length,
            itemBuilder: (context, index) {
              return Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 1, color: Color(0xff8592E5)),
                        //color: Colors.teal,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Center(
                              child: Text(
                                "'O' Cell (PRBC) Suspended in AB",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  height: 1,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff354291),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            color: Color(0xffE4E8FF),
                            height: 25,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "TK. 5440",
                                    style: GoogleFonts.poppins(
                                      color: Color(0xff9EA5D2),
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "TK. 5440",
                                    style: GoogleFonts.poppins(
                                        color: Color(0xff3343A4),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 25,
                            child: Center(
                              child: Text(
                                "DEPT: BLOOD TRANSFUSION",
                                style: GoogleFonts.poppins(
                                    color: Color(0xff3343A4), fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(14),
                                bottomLeft: Radius.circular(14),
                              ),
                              //color: Colors.teal,
                              color: AppTheme.appbarPrimary,
                            ),
                            height: 35,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.cartPlus,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Add to Cart",
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 15),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 160,
                      bottom: 115,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            width: 1,
                            color: Color(0xff8592E5),
                          ),
                          color: Color(0xffEC1979),
                        ),
                        child: Center(
                          child: Text(
                            "-15%",
                            style: GoogleFonts.poppins(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
