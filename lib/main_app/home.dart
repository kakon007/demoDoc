import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:location/location.dart';
import 'package:myhealthbd_app/features/auth/view_model/accessToken_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view/dash_board_screen.dart';
import 'package:myhealthbd_app/features/hospitals/models/nearest_hospital_model.dart';
import 'package:myhealthbd_app/features/hospitals/view/hospital_screen.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/nearest_hospital_view_model.dart';
import 'package:myhealthbd_app/features/my_health/view/patient_portal_screen.dart';
import 'package:myhealthbd_app/features/notification/view/notification_screen.dart';
import 'package:myhealthbd_app/features/setting/view/setting_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view/family_member_list_screen.dart';
import 'package:myhealthbd_app/features/user_profile/view/widgets/switch_account.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_drawer.dart';
import 'package:myhealthbd_app/main_app/views/widgets/sign_in_dashBoard_prompt.dart';
import 'package:myhealthbd_app/main_app/views/widgets/sign_in_dashboard_prompt_for_patient_profile.dart';
import 'package:provider/provider.dart';

import '../features/appointment_history/view/get_appointment_screen.dart';

class HomeScreen extends StatefulWidget {
  final String accessToken;
  final bool connection;
  HomeScreen({this.accessToken, this.connection});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> scaleAnimation;
  Duration duration = Duration(milliseconds: 200);
  bool isDrawerOpen = false;
  bool isSelected = false;
  int currentIndex = 0;
  Location location = new Location();

  LocationData _currentPosition;
  List<Items> hospitalList2;
  _moveTo(int index) {
    currentIndex = index;
    setState(() {});
  }

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(25.0),
    topRight: Radius.circular(25.0),
  );

  FocusNode f1 = FocusNode();
  getLocationPermission() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    _currentPosition = await location.getLocation();
    var vm9 = Provider.of<NearestHospitalViewModel>(context, listen: false);
    vm9.getData(
        userLatitude: _currentPosition?.latitude, userLongitude: _currentPosition?.longitude);
    hospitalList2 = vm9.hospitalList2;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (widget.connection == false) {
        Fluttertoast.showToast(
            msg: "Please Check Internet Connection!!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0);
      }
    });
    _animationController = AnimationController(vsync: this, duration: duration);
    scaleAnimation = Tween<double>(begin: 1.0, end: 0.7).animate(_animationController);
    getLocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    var accessTokenVm = Provider.of<AccessTokenProvider>(context, listen: true);
    var deviceWidth = MediaQuery.of(context).size.width;
    bool isLoggedIn = accessTokenVm.accessToken != null;
    List<Widget> screenList = [
      DashboardScreen(
        menuCallBack: () {
          setState(() {
            isDrawerOpen = true;
            _animationController.forward();
            print("Heeoollo");
          });
        },
        isDrawerOpen: isDrawerOpen,
        accessToken: accessTokenVm.accessToken,
        locationData: _currentPosition,
      ),
      if (!isLoggedIn) ...[
        SignInDashboardForAppoinmentPrompt("To access your Appointments,"),
        SignInDashboardForPatientPrompt("To access your Patient Portal,"),
      ],
      if (isLoggedIn) ...[
        GetAppointment(
          locationData: _currentPosition,
          hospitalList2: hospitalList2,
        ),
        PrescriptionListScreen(
          accessToken: accessTokenVm.accessToken,
        ),
        FamilyMemberListScreen(),
        SwitchAccount(),
        NotificationScreen(),
      ],
      SettingScreen(
        accessToken: accessTokenVm.accessToken,
      ),
    ];

    print(widget.accessToken);
    final String dashboardiconiamg = "assets/icons/dashboard_icon.svg";
    final Widget dashboardicon = SvgPicture.asset(
      dashboardiconiamg,
      width: 10,
      color: currentIndex == 0 ? HexColor('#354291') : HexColor('#969EC8'),
      height: 20,
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      key: Key('dashboardBottomNavbarKey'),
      //semanticsLabel: 'Acme Logo'
    );

    final String appointmenticonimg = "assets/icons/appointment_icon.svg";
    final Widget appointmenticon = SvgPicture.asset(
      appointmenticonimg,
      width: 10,
      height: 20,
      color: currentIndex == 1 ? HexColor('#354291') : HexColor('#969EC8'),
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      key: Key('appointmentBottomNavbarKey'),
      //semanticsLabel: 'Acme Logo'
    );

    final String hospitaliconimag = "assets/icons/hospital_icon.svg";
    final Widget hospitalicon = SvgPicture.asset(
      hospitaliconimag,
      key: Key('hospitalBottomNavbarKey'),
      width: 10,
      height: 20,
      color: currentIndex == 2 ? HexColor('#354291') : HexColor('#969EC8'),
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      //semanticsLabel: 'Acme Logo'
    );

    final String myhealthiconimag = "assets/icons/myhealth_icon.svg";
    final Widget myhealthicon = SvgPicture.asset(
      myhealthiconimag,
      width: 10,
      height: 20,
      color: currentIndex == 3 ? HexColor('#354291') : HexColor('#969EC8'),
      fit: BoxFit.fitWidth,
      allowDrawingOutsideViewBox: true,
      matchTextDirection: true,
      key: Key('myHealthBottomNavbarKey'),
      //semanticsLabel: 'Acme Logo'
    );

    //List Of Pages
    List pages = <Widget>[
      Stack(children: [
        DrawerScreen(
          accessToken: accessTokenVm.accessToken,
          menuCallBack: (selectedIndex) {
            setState(() {
              final selectedWidget = screenList.removeAt(selectedIndex);
              screenList.insert(0, selectedWidget);
              if (selectedIndex != 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => selectedWidget));
              }
            });
          },
        ),
        AnimatedPositioned(
          duration: duration,
          top: 0,
          left: isDrawerOpen ? deviceWidth * 0.50 : 0,
          right: isDrawerOpen ? deviceWidth * -0.45 : 0,
          bottom: 0,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: GestureDetector(
              onTap: () {
                if (isDrawerOpen) {
                  setState(() {
                    isDrawerOpen = false;
                    _animationController.reverse();
                  });
                }
              },
              child: screenList[0],
            ),
          ),
        )
      ]),
      accessTokenVm.accessToken == null
          ? SignInDashboardForAppoinmentPrompt("To access your Appointments,")
          : GetAppointment(
              accessToken: accessTokenVm.accessToken,
              locationData: _currentPosition,
              hospitalList2: hospitalList2,
            ),
      HospitalScreen(
        f1: f1,
        locationData: _currentPosition,
        hospitalList2: hospitalList2,
      ),
      accessTokenVm.accessToken == null
          ? SignInDashboardForPatientPrompt("To access your Patient Portal,")
          : PrescriptionListScreen(
              accessToken: accessTokenVm.accessToken,
            ),
    ];

    //BottomNavBar
    var bottomNavBar = BottomNavigationBar(
        onTap: (int index) {
          f1.unfocus();
          if (currentIndex != index) {
            _moveTo(index);
          }
        },
        currentIndex: currentIndex,
        selectedItemColor: HexColor('#354291'),
        unselectedItemColor: HexColor('#969EC8'),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 20.0,
        type: BottomNavigationBarType.fixed,
        items: [
          //dashboard
          BottomNavigationBarItem(
              icon: Material(
                color: Colors.transparent,
                child: dashboardicon,

                // ignore: deprecated_member_use
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(StringResources.dashboardNavBarText),
              )),
          //appointments
          // ignore: deprecated_member_use
          BottomNavigationBarItem(
              icon: Material(
                color: Colors.transparent,
                child: appointmenticon,

                // ignore: deprecated_member_use
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(StringResources.appointmentNavBarText),
              )),
          //hospitals
          // ignore: deprecated_member_use
          BottomNavigationBarItem(
              icon: Material(
                color: Colors.transparent,
                child: hospitalicon,

                // ignore: deprecated_member_use
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(StringResources.hospitalNavBarText),
              )),
          //my_health
          // ignore: deprecated_member_use
          BottomNavigationBarItem(
              icon: Material(
                color: Colors.transparent,
                child: myhealthicon,

                // ignore: deprecated_member_use
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(StringResources.myHealthNavBarText),
              ))
        ]);

    return MaterialApp(
      title: "MyHealthBD",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: HexColor('#354291'),
        unselectedWidgetColor: HexColor('#8592E5'),
      ),
      home: WillPopScope(
          child: Scaffold(
            bottomNavigationBar: bottomNavBar,
            body: pages[currentIndex],
          ),
          onWillPop: () async {
            if (currentIndex == 0)
              return true;
            else {
              _moveTo(0);
              return false;
            }
          }),
    );
  }
}
