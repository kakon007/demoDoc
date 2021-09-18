import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/book_test/model/company_list_model.dart';
import 'package:myhealthbd_app/features/book_test/model/test_item_model.dart';
import 'package:myhealthbd_app/features/book_test/view/booking_summery_screen.dart';
import 'package:myhealthbd_app/features/book_test/view_model/company_list_view_model.dart';
import 'package:myhealthbd_app/features/book_test/view_model/test_item_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
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
  // TextEditingController bookTestController = TextEditingController();
  ScrollController _scrollController;
  TextEditingController deptController = TextEditingController();
  ScrollController _scrollController2 = ScrollController();
  String _selectedGender;
  int companyNo;
  var genderBorderColor = "#EAEBED";

  List<TestItem> deptList;
  var deptItems = <TestItem>[];
  var deptSelectedItem;
  List _items3 = [];
  bool isFiltered = false;
  var doctorItem = "";

  @override
  Future<void> initState() {

    Future.delayed(Duration.zero, () async {
      var vm2 = Provider.of<CompanyListViewModel>(context, listen: false);
      await vm2.getData();
      var vm = Provider.of<TestItemViewModel>(context, listen: false);
       await  vm.getData(companyNo: 2);
      _scrollController = ScrollController();
      _scrollController2.addListener(() {
        if (_scrollController2.position.pixels >= _scrollController2.position.maxScrollExtent - 100) {
          vm.getMoreData(companyNo: vm2.companyNo,buList: deptSelectedItem);
        }
      });
      deptList=vm.testItemList;
      deptItems.addAll(deptList);
      print('list $deptList');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var testItemVm = Provider.of<TestItemViewModel>(context);
    var vm = Provider.of<CompanyListViewModel>(context);
    var width = MediaQuery.of(context).size.width * 0.44;
    var height = MediaQuery.of(context).size.height;
    var horizontalSpace = SizedBox(
      height: height >= 600 ? 10.0 : 5.0,
    );
    var verticalSpace = SizedBox(
      width: MediaQuery.of(context).size.width >= 400 ? 10.0 : 5.0,
    );

    bool isDesktop = Responsive.isDesktop(appNavigator.context);
    bool isTablet = Responsive.isTablet(appNavigator.context);
    bool isMobile = Responsive.isMobile(appNavigator.context);


    print('company $_selectedGender');
    var shift= Container(
      height: isTablet ? 50 : 50.0,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child:vm.companyList==null?Center(child: Text('No hospital available!'),): Padding(
        padding: const EdgeInsets.only(left:10.0,right: 10),
        child: Container(
          width: width ,
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField(
              onTap: () {
                FocusManager.instance.primaryFocus.unfocus();
              },
              key: Key('signUpGenderKey'),
              icon: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: _selectedGender != null
                    ? Colors.black54
                    : HexColor("#D2D2D2"),
              ),
              iconSize: 25,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  enabledBorder: InputBorder.none),
              isExpanded: true,
              hint: Text(
                vm.companyList.items.first.companyName,
                style: GoogleFonts.roboto(
                    fontSize: isTablet ? 17 : 15,
                    color: Colors.black),
              ),
              value: companyNo,
              onChanged: (newValue) async{
                companyNo = newValue;
                await vm.companyInfo(companyNo: companyNo);
                testItemVm.getData(companyNo: vm.companyNo);
                testItemVm.getMoreData(companyNo: vm.companyNo);
                setState(()   {

                });
              },
              items: vm.companyList.items.map((gender) {
                return DropdownMenuItem(
                  child:  Text(
                    gender.companyName,
                    style: GoogleFonts.roboto(fontSize: 14),
                  ),
                  value: gender.companyNo,
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );


    void departmentSearch(String query) {
      List<TestItem> initialDeptSearch = List<TestItem>();
      initialDeptSearch.addAll(deptList);
      if (query.isNotEmpty) {
        List<TestItem> initialDeptSearchItems = List<TestItem>();
        initialDeptSearch.forEach((item) {
          if (item.buName.contains(query)) {
            initialDeptSearchItems.add(item);
          }
        });
        setState(() {
          deptItems.clear();
          deptItems.addAll(initialDeptSearchItems);
        });
        return;
      } else {
        setState(() {
          deptItems.clear();
          deptItems.addAll(deptList);
        });
      }
    }

    var searchDepartment = TextField(
        onChanged: (value) {
          departmentSearch(value.toUpperCase());
        },
        controller: deptController,
        decoration: new InputDecoration(
          hintStyle: GoogleFonts.poppins(fontSize: isTablet ? 16 : 14),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: width / 8.64, right: width / 8.64),
            child: Icon(Icons.search),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: width / 8.64),
            child: Container(
              width: 20,
              height: 15,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.appbarPrimary,
              ),
              child: GestureDetector(
                  onTap: () {
                    deptController.clear();
                    departmentSearch('');
                  },
                  child: Icon(
                    Icons.clear,
                    size: 15,
                    color: Colors.white,
                  )),
            ),
          ),
          hintText: StringResources.searchDepartment,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#D6DCFF"), width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#EAEBED"), width: 1),
            borderRadius: BorderRadius.circular(25),
          ),
          border: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: new BorderSide(color: Colors.teal)),
          contentPadding: EdgeInsets.fromLTRB(15.0, 20.0, 40.0, 0.0),
        ));
    var modalSheetTitle = Padding(
      padding: EdgeInsets.only(left: width / 6.912, right: width / 6.912),
      child: Column(
        children: [
          horizontalSpace,
          horizontalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpace,
              Text(
                StringResources.filters,
                key: Key('filtersKey'),
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? 18 : 15,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Future.delayed(Duration.zero, () async {
                      var testItemVm = Provider.of<TestItemViewModel>(context,listen: false);
                      await Navigator.pop(context);
                      if (deptSelectedItem == null ) {
                        deptController.clear();
                        _items3.clear();
                        isFiltered = false;
                        await testItemVm.getData(companyNo: vm.companyNo,doctorSearch: doctorItem);
                      }
                    });
                  },
                  child: Icon(Icons.clear)),
            ],
          ),
          horizontalSpace,
          horizontalSpace
        ],
      ),
    );
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
                          )).then((value){
                            testItemVm.cartList;
                            setState(() {

                            });
                      });
                    }),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 70,
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
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                      // TypeAheadFormField<CompanyItem>(
                      //   textFieldConfiguration: TextFieldConfiguration(
                      //       textInputAction: TextInputAction.search,
                      //       controller: bookTestController,
                      //       decoration: InputDecoration(
                      //         contentPadding: EdgeInsets.only(bottom: 20,left: 20,right: 20,top: 10),
                      //         // labelText: "Route",
                      //         //labelStyle: TextStyle(color: Color(0xff3E58FF)),
                      //         //hintText: "Route",
                      //         //hintStyle: TextStyle(color: Colors.grey),
                      //         // prefixIcon: Icon(
                      //         //   Icons.search,
                      //         //   color: Colors.grey,
                      //         // ),
                      //         suffix: Icon(
                      //           Icons.keyboard_arrow_down_outlined,
                      //           color: Colors.grey,
                      //         ),
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(20.0),
                      //         ),
                      //         focusedBorder: OutlineInputBorder(
                      //           borderSide:
                      //               const BorderSide(color: Color(0xff3E58FF)),
                      //           borderRadius: BorderRadius.circular(15.0),
                      //         ),
                      //       )),
                      //   itemBuilder: (_, v) {
                      //     return Padding(
                      //       padding: EdgeInsets.all(10.0),
                      //       child: Text("${v.companyName}"),
                      //     );
                      //   },
                      //   onSuggestionSelected: (v) async {
                      //     bookTestController.text = v.companyName;
                      //     await vm.companyInfo(companyNo: v.companyNo);
                      //     testItemVm.getData(companyNo: vm.companyNo);
                      //     testItemVm.getMoreData(companyNo: vm.companyNo);
                      //     setState(() {});
                      //   },
                      //   suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      //     borderRadius: BorderRadius.circular(5),
                      //   ),
                      //   suggestionsCallback: (v) {
                      //     return vm.companyList.items.where((element) => element
                      //         .companyName
                      //         .toString()
                      //         .toLowerCase()
                      //         .contains(v.toLowerCase()));
                      //   },
                      // ),

                      shift,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child: GestureDetector(
                      onTap: () {
                        print('item $deptItems');
                        FocusScope.of(context).unfocus();
                        showModalBottomSheet(
                          //enableDrag: false,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20), topRight: Radius.circular(20))),
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                return FractionallySizedBox(
                                  heightFactor: .95,
                                  child: Column(
                                    children: [
                                      modalSheetTitle,
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: width / 6.912, right: width / 6.912),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: isTablet ? height / 2.7 : height / 1.5,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(25),
                                                      topRight: Radius.circular(25)),
                                                  border: Border.all(
                                                    color: HexColor("#D6DCFF"),
                                                    width: 1.0,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    searchDepartment,
                                                    Expanded(
                                                      child: Scrollbar(
                                                        isAlwaysShown: true,
                                                        controller: _scrollController,
                                                        child: ListView(
                                                          controller: _scrollController,
                                                          children: deptItems
                                                              .map(
                                                                (TestItem item) => Container(
                                                              height: 35,
                                                              child: CheckboxListTile(
                                                                dense: true,
                                                                activeColor: AppTheme.signInSignUpColor,
                                                                controlAffinity:
                                                                ListTileControlAffinity.leading,
                                                                title: Text(
                                                                  item.buName,
                                                                  style: GoogleFonts.poppins(
                                                                      fontSize: isTablet ? 18 : 15,
                                                                      fontWeight: item.isChecked == true
                                                                          ? FontWeight.w600
                                                                          : FontWeight.normal),
                                                                ),
                                                                value: item.isChecked,
                                                                onChanged: (bool val) {
                                                                  setState(() {
                                                                    // print('${deptItems.indexOf(item)}');
                                                                    val == true
                                                                        ? _items3.add(item.buNo)
                                                                        : _items3.remove(item.buNo);
                                                                   // print(_items1);
                                                                    print(_items3);
                                                                    item.isChecked = val;
                                                                    var stringList =
                                                                    _items3.join("&buList%5B%5D=");
                                                                    print(stringList);
                                                                    if (_items3.isEmpty) {
                                                                      deptSelectedItem = null;
                                                                    } else {
                                                                      deptSelectedItem =
                                                                          "&buList%5B%5D=" + stringList;
                                                                      print('item ${item.buName}');
                                                                      print('item $deptSelectedItem');
                                                                    }
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          )
                                                              .toList(),
                                                        ),
                                                      ),
                                                    ),
                                                    // SizedBox(height: 10,),
                                                  ],
                                                ),
                                              ),
                                              horizontalSpace,

                                              SizedBox(
                                                height: isTablet
                                                    ? 45
                                                    : height >= 600
                                                    ? 25
                                                    : 15,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  AbsorbPointer(
                                                    absorbing:_items3.isEmpty ||
                                                        isFiltered == false
                                                        ? true
                                                        : false,
                                                    child: SizedBox(
                                                      width: width * .9,
                                                      height: isTablet ? 50 : width * .25,
                                                      child: FlatButton(
                                                        onPressed: () {

                                                          print('lst $_items3');
                                                          isFiltered = false;
                                                          testItemVm.testItemList.forEach((element) {
                                                            print('block');
                                                            element.isChecked = false;
                                                            print("chk ${element.isChecked}");
                                                          });
                                                          deptItems=testItemVm.testItemList;
                                                          deptController.clear();
                                                          departmentSearch('');
                                                          deptSelectedItem = null;
                                                          _items3.clear();
                                                          testItemVm.getData(companyNo: vm.companyNo,doctorSearch: doctorItem);
                                                          Navigator.pop(context);
                                                          setState((){});
                                                        },
                                                        textColor: Colors.white,
                                                        color:_items3.isEmpty ||
                                                            isFiltered == false
                                                            ? HexColor("#969EC8")
                                                            : AppTheme.appbarPrimary,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(8),
                                                            side: BorderSide(
                                                              color:_items3.isEmpty ||
                                                                  isFiltered == false
                                                                  ? HexColor("#969EC8")
                                                                  : AppTheme.appbarPrimary,
                                                                width: 1)),
                                                        child: Text(
                                                          StringResources.clearFilterText,
                                                          style: GoogleFonts.poppins(),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  AbsorbPointer(
                                                    absorbing: _items3.isEmpty?true:false,
                                                    child: SizedBox(
                                                      width: width * .9,
                                                      height: isTablet ? 50 : width * .25,
                                                      child: FlatButton(
                                                        textColor: Colors.white,
                                                        onPressed: () {
                                                          deptItems.sort((a, b) => b.isChecked ? 1 : -1);
                                                          //specialityItems.sort((a, b) => b.isChecked ? 1 : -1);
                                                          isFiltered = true;
                                                          Navigator.pop(context);
                                                          testItemVm.getData(companyNo: vm.companyNo,buList: deptSelectedItem,doctorSearch: doctorItem);
                                                        },
                                                        color:
                                                         _items3.isEmpty
                                                            ?
                                                            HexColor("#969EC8")
                                                            : AppTheme.appbarPrimary,
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(8),
                                                        ),
                                                        child: Text(
                                                          StringResources.applyFilterText,
                                                          style: GoogleFonts.poppins(),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0, bottom: 25),
                        child: SvgPicture.asset(
                          "assets/icons/fliter.svg",
                          key: Key('filterIconKey'),
                          width: 10,
                          height: 18,
                          fit: BoxFit.contain,
                          allowDrawingOutsideViewBox: true,
                          matchTextDirection: true,
                          //color: isFiltered == true ? AppTheme.appbarPrimary : Colors.grey,
                          //semanticsLabel: 'Acme Logo'
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: testItemVm.testItemList == null
                  ? Loader()
                  : Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: GridView.builder(
                          controller: _scrollController2,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisExtent: 150,
                            maxCrossAxisExtent: 300,
                            childAspectRatio: (itemWidth / itemHeight),
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                          ),
                          itemCount: testItemVm.testItemList.length,
                          itemBuilder: (context, index) {

                            if (index == testItemVm.testItemList.length) {
                              return testItemVm.isFetchingMoreData
                                  ? SizedBox(
                                  height: 80,
                                  child:
                                  Center(child: CircularProgressIndicator()))
                                  : SizedBox();
                              //return SizedBox(height: 15,);

                            }
                            return Container(
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          width: 1, color: Color(0xff8592E5)),
                                      //color: Colors.teal,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: Center(
                                            child: Text(
                                              testItemVm
                                                  .testItemList[index].itemName,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                testItemVm.testItemList[index]
                                                            .maxDisPct !=
                                                        0.0
                                                    ? Text(
                                                        testItemVm
                                                            .testItemList[index]
                                                            .salesPrice
                                                            .toString(),
                                                        style:
                                                            GoogleFonts.poppins(
                                                          color:
                                                              Color(0xff9EA5D2),
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontSize: 14,
                                                        ),
                                                      )
                                                    : SizedBox(),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  testItemVm.testItemList[index]
                                                      .discountPrice
                                                      .toString(),
                                                  style: GoogleFonts.poppins(
                                                      color: Color(0xff3343A4),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                  color: Color(0xff3343A4),
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        testItemVm.testItemList[index].isAdded || testItemVm.cartList==null
                                            ? Row(
                                              children: [
                                                Expanded(
                                                  flex:1,
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(14),
                                                        ),
                                                        //color: Colors.teal,
                                                        color: Color(0xffCCCCCC)
                                                      ),
                                                      height: 35,
                                                      child:  Center(
                                                        child: Text(
                                                          "Added",
                                                          style:
                                                          GoogleFonts.poppins(
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              color: Colors
                                                                  .white,
                                                              fontSize: 15),
                                                        ),
                                                      ),
                                                    ),
                                                ),
                                                InkWell(
                                                  onTap:(){
                                                    testItemVm.isAdded(
                                                        index: index);
                                                    testItemVm.cartList.removeAt(index);
                                                    testItemVm.salesPrice.removeAt(index);
                                                    testItemVm.discountPrice.removeAt(index);
                                                    testItemVm.discountAmt.removeAt(index);
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius.only(
                                                          bottomRight:
                                                          Radius.circular(14),
                                                        ),
                                                        //color: Colors.teal,
                                                        color: Color(0xffFF8585)
                                                    ),
                                                    height: 35,
                                                    width:40,
                                                    child: Icon(Icons.clear,color: Colors.white,),
                                                  ),
                                                ),
                                              ],
                                            )
                                            : InkWell(
                                                onTap: () async {
                                                  await testItemVm.addToCart(
                                                      cartList: testItemVm
                                                          .testItemList[index],
                                                      salesPrice: testItemVm
                                                          .testItemList[index]
                                                          .salesPrice,
                                                      discountAmt: testItemVm
                                                          .testItemList[index]
                                                          .discountAmt,
                                                      discountPrice: testItemVm
                                                          .testItemList[index]
                                                          .discountPrice);
                                                  testItemVm.isAdded(
                                                      index: index);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(14),
                                                      bottomLeft:
                                                          Radius.circular(14),
                                                    ),
                                                    //color: Colors.teal,
                                                    color:
                                                        AppTheme.appbarPrimary,
                                                  ),
                                                  height: 35,
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          FontAwesomeIcons
                                                              .cartPlus,
                                                          color: Colors.white,
                                                          size: 18,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          "Add to Cart",
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
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
                                  testItemVm.testItemList[index].maxDisPct ==
                                          0.0
                                      ? SizedBox()
                                      : Positioned(
                                          left: 160,
                                          bottom: 115,
                                          child: Container(
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
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
                                                    color: Colors.white,
                                                    fontSize: 10),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                            );
                          }),
                    ),
            )
          ],
        ));
  }
}
