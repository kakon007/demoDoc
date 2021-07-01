import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/hospital_list_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/models/hospital_list_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/hospital_image_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/hospital_logo_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/nearest_hospital_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/features/hospitals/view/widgets/hospitalListCard.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';

class HospitalScreen extends StatefulWidget {
  //bool isNotNave;
  FocusNode f1;
  LocationData locationData;
  HospitalScreen({this.f1,this.locationData});
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> with AfterLayoutMixin {
  var accessToken;
  ScrollController _scrollController;

  loadImage(String image){
    Uint8List  _bytesImage = Base64Decoder().convert(image);
    return _bytesImage;

  }

  loadLogo(String image){
    Uint8List  _bytesImage = Base64Decoder().convert(image);
    return _bytesImage;
  }

  TextEditingController hospitalController = TextEditingController();
  List<Item> hospitalList;
  var hospitalItems = List<Item>();
  @override
  void afterFirstLayout(BuildContext context) {
    _scrollController = ScrollController();
    Future.delayed(Duration.zero,() async{
      var vm = Provider.of<HospitalListViewModel>(context, listen: false);
      vm.getData();
      print(vm.hospitalList.length);
      var vm5 = Provider.of<HospitalLogoViewModel>(context, listen: false);
      vm5.getData();
      var vm6 = Provider.of<HospitalImageViewModel>(context, listen: false);
      vm6.getImageData();
      await vm.getData();
      hospitalList = vm.hospitalList;
        hospitalItems.addAll(hospitalList);

    });
  }

  void hospitalSearch(String query) {
    print(query);
    List<Item> initialHospitalSearch = List<Item>();
   hospitalList.forEach((element) {
     initialHospitalSearch.add(element);
   });
    if(query.isNotEmpty) {
      List<Item> initialHospitalSearchItems = List<Item>();
      initialHospitalSearch.forEach((item) {
        if(item.companyName.contains(query.toLowerCase())) {
          initialHospitalSearchItems.add(item);
        }
      });
      setState(() {
        hospitalItems.clear();
        hospitalItems.addAll(initialHospitalSearchItems);
      });
      return;
    } else {
      setState(() {
        hospitalItems.clear();
        hospitalItems.addAll(hospitalList);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var searchField = SignUpFormField(
      focusNode: widget.f1,
      onChanged: (value) {
        hospitalSearch(value);
        // print(value);
      },
      textFieldKey: Key('hospitalSearchFieldKey'),
      focusBorderColor:"#8592E5",
      controller: hospitalController,
      borderRadius: 30,
      minimizeBottomPadding: true,
      hintSize : isTablet? 17 : 12,
      hintText: StringResources.searchBoxHint,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          Icons.search_rounded,
          //color: Colors.grey,
        ),
      ),
    );
    var vm = Provider.of<HospitalListViewModel>(context);
    var vm5 = Provider.of<HospitalLogoViewModel>(context);
    var vm6 = Provider.of<HospitalImageViewModel>(context);
    var vm9 = appNavigator.getProviderListener<NearestHospitalViewModel>();
    List<Item> list = vm.hospitalList;
    var length = list.length;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppTheme.appbarPrimary,
        title: Text(
          StringResources.hospitalListAppbar,
          key: Key('hospitalAppbarKey'),
          style: GoogleFonts.poppins(fontSize: isTablet? 20 : 15),
        ),
        actions: <Widget>[
          accessToken != null
              ? Container(
                  //margin: EdgeInsets.all(100.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/alok.png"),
                    radius: 15.0,
                  ),
                )
              : SizedBox(),
          SizedBox(
            width: 10,
          ),
          // IconButton(
          //   icon: Icon(
          //     Icons.notifications,
          //     color: Colors.white,
          //     size: 20,
          //   ),
          //   onPressed: () {},
          // )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: (){
          return Provider.of<HospitalListViewModel>(context, listen: false)
              .refresh();
        },
        child: Padding(
          padding: EdgeInsets.only(left: isTablet? 18 : 8.0, right: isTablet? 18 : 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              searchField,
              widget.locationData!=null?
              vm9.shouldShowPageLoader||vm5.shouldShowPageLoader || vm6.shouldShowPageLoaderForImage? Loader():  Expanded(
    child: ListView.builder(
    key: Key('listViewBuilderKey'),
    shrinkWrap: true,
    itemCount: vm9.hospitalList2.length,
    itemBuilder: (BuildContext context, int index) {
    int logoIndex = vm5.hospitalLogoList.indexWhere((element) => element.id==vm9.hospitalList2[index].id);
    int imageIndex = vm6.hospitalImageList.indexWhere((element) => element.id==vm9.hospitalList2[index].id);
    return HospitalListCard(loadImage(vm5.hospitalLogoList[logoIndex].photoLogo),
    vm6.hospitalImageList[imageIndex].photoImg!=null?loadImage(vm6.hospitalImageList[imageIndex].photoImg):loadLogo(vm5.hospitalLogoList[index].photoLogo),
      vm9.hospitalList2[index].companyName,
      vm9.hospitalList2[index].companyAddress == null
    ? "Mirpur,Dahaka,Bangladesh"
        : vm9.hospitalList2[index].companyAddress,
    "60 Doctors",
      vm9.hospitalList2[index].companyPhone == null
    ? "+880 1962823007"
        : vm9.hospitalList2[index].companyPhone,
      vm9.hospitalList2[index].companyEmail == null
    ? "info@mysoftitd.com"
        : list[index].companyEmail,
      vm9.hospitalList2[index].companyLogo,
      vm9.hospitalList2[index].companyId,
      vm9.hospitalList2[index].ogNo.toString(),
      vm9.hospitalList2[index].id.toString(),
    index.toString(),
    );
    })):
              vm.shouldShowPageLoader||vm5.shouldShowPageLoader || vm6.shouldShowPageLoaderForImage? Loader():  Expanded(
                child: ListView.builder(
                    key: Key('listViewBuilderKey'),
                    shrinkWrap: true,
                    itemCount: hospitalItems.length,
                    itemBuilder: (BuildContext context, int index) {
                      int logoIndex = vm5.hospitalLogoList.indexWhere((element) => element.id==hospitalItems[index].id);
                      int imageIndex = vm6.hospitalImageList.indexWhere((element) => element.id==hospitalItems[index].id);
                      return HospitalListCard(loadImage(vm5.hospitalLogoList[logoIndex].photoLogo),
                        vm6.hospitalImageList[imageIndex].photoImg!=null?loadImage(vm6.hospitalImageList[imageIndex].photoImg):loadLogo(vm5.hospitalLogoList[index].photoLogo),
                        hospitalItems[index].companyName,
                        hospitalItems[index].companyAddress == null
                            ? "Mirpur,Dahaka,Bangladesh"
                            : hospitalItems[index].companyAddress,
                        "60 Doctors",
                        hospitalItems[index].companyPhone == null
                            ? "+880 1962823007"
                            : hospitalItems[index].companyPhone,
                        hospitalItems[index].companyEmail == null
                            ? "info@mysoftitd.com"
                            : list[index].companyEmail,
                        hospitalItems[index].companyLogo,
                        hospitalItems[index].companyId,
                        hospitalItems[index].ogNo.toString(),
                        hospitalItems[index].id.toString(),
                        index.toString(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
