import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/features/book_test/model/company_list_model.dart';
import 'package:myhealthbd_app/features/book_test/view/booking_summery_screen.dart';
import 'package:myhealthbd_app/features/book_test/view_model/company_list_view_model.dart';
import 'package:myhealthbd_app/features/book_test/view_model/test_item_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class BookTestScreen extends StatefulWidget {
  const BookTestScreen({Key key}) : super(key: key);

  @override
  _BookTestScreenState createState() => _BookTestScreenState();
}

class _BookTestScreenState extends State<BookTestScreen> {
  final double itemHeight = (442 - kToolbarHeight - 24) / 3;
  final double itemWidth = 200 / 2;
  TextEditingController bookTestController = TextEditingController();
  @override
  Future<void> initState() {
    Future.delayed(Duration.zero, () async {
      var vm2= Provider.of<CompanyListViewModel>(context, listen: false);
      await vm2.getData();
      var vm= Provider.of<TestItemViewModel>(context, listen: false);
      vm.getData(companyNo: 2);
      bookTestController.text=vm2.companyList.items.first.companyName;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var testItemVm = Provider.of<TestItemViewModel>(context);
    var vm = Provider.of<CompanyListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Book Test"),
        backgroundColor: AppTheme.appbarPrimary,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Badge(
              position: BadgePosition.topEnd(top: 3, end: 3),
              animationDuration: Duration(milliseconds: 300),
              animationType: BadgeAnimationType.scale,
              badgeContent: Text(
                testItemVm.cartList.length.toString(),
                style: TextStyle(color: Colors.white),
              ),
              child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  padding: EdgeInsets.only(right: 5.0),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingSummeryScreen(),
                        ));
                  }),
            ),
          ),
        ],
      ),
      body:
      Column(
        children: [

          Container(
            height: 60,
            width: double.infinity,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                bottomLeft: const Radius.circular(12.0),
                bottomRight: const Radius.circular(12.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypeAheadFormField<CompanyItem>(
                textFieldConfiguration: TextFieldConfiguration(
                    textInputAction: TextInputAction.search,
                    controller: bookTestController,
                    decoration: InputDecoration(
                      // labelText: "Route",
                      //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                      //hintText: "Route",
                      //hintStyle: TextStyle(color: Colors.grey),
                      // prefixIcon: Icon(
                      //   Icons.search,
                      //   color: Colors.grey,
                      // ),
                      suffix: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.grey,
                          ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xff3E58FF)),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )),
                itemBuilder: (_, v) {
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("${v.companyName}"),
                  );
                },
                onSuggestionSelected: (v) async {
                  bookTestController.text = v.companyName;
                 await vm.companyInfo(companyNo: v.companyNo);
                  testItemVm.getData(companyNo: vm.companyNo);
                  setState(() {

                  });
                },

                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                suggestionsCallback: (v) {
                  return vm.companyList.items.where((element) => element.companyName.toString().toLowerCase().contains(v.toLowerCase()));
                },
              ),
            ),
          ),
          Expanded(child: testItemVm.testItemList==null?Loader(): Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:GridView.builder(
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
                                    testItemVm.testItemList[index].itemName,
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
                                      testItemVm.testItemList[index].maxDisPct!=0.0?
                                      Text(
                                        testItemVm.testItemList[index].salesPrice.toString(),
                                        style: GoogleFonts.poppins(
                                          color: Color(0xff9EA5D2),
                                          decoration: TextDecoration.lineThrough,
                                          fontSize: 14,
                                        ),
                                      ):SizedBox(),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        testItemVm.testItemList[index].discountPrice.toString(),
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
                                    "DEPT: ${testItemVm.testItemList[index].buName}",
                                    style: GoogleFonts.poppins(
                                        color: Color(0xff3343A4), fontSize: 12),
                                  ),
                                ),
                              ),
                              testItemVm.testItemList[index].isAdded?SizedBox():InkWell(
                                onTap: ()async{
                                  await testItemVm.addToCart(cartList: testItemVm.testItemList[index],salesPrice: testItemVm.testItemList[index].salesPrice,discountAmt: testItemVm.testItemList[index].discountAmt,discountPrice: testItemVm.testItemList[index].discountPrice);
                                  testItemVm.isAdded(index: index);
                                  setState(() {

                                  });
                                },
                                child: Container(
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
                              ),
                            ],
                          ),
                        ),
                        testItemVm.testItemList[index].maxDisPct==0.0?SizedBox():Positioned(
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
                                '-${testItemVm.testItemList[index].maxDisPct}%',
                                style: GoogleFonts.poppins(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),)
        ],
      )
    );
  }
}
