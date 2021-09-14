import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myhealthbd_app/admin/add_patient/view/patient_portal_user_list.dart';
import 'package:myhealthbd_app/admin/dashboard/widgets/admin_drawer.dart';
import 'package:myhealthbd_app/admin/dashboard/widgets/manage_admin_profile_prompt.dart';
import 'package:myhealthbd_app/doctor/main_app/resource/doctor_const.dart';
import 'package:myhealthbd_app/features/user_profile/view_model/user_image_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  void initState() {
    // TODO: implement initState
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: false);
    Future.delayed(Duration.zero, () async {
      await companyInfoVm.userImage();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var deviceHeight = MediaQuery.of(context).size.height;
    var companyInfoVm = Provider.of<UserImageViewModel>(context, listen: true);
    var photo = companyInfoVm.details?.photo ?? '';
    var width = MediaQuery.of(context).size.width;
    var appointmentReport = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppTheme.appbarPrimary)),
      height: 100,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            appointReport,
            width: 20,
            height: 30,
            color: AppTheme.buttonActiveColor,
            fit: BoxFit.fitWidth,
            allowDrawingOutsideViewBox: true,
            matchTextDirection: true,
          ),
          Text(
            'Appointment Report',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
    var collectionreport = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppTheme.appbarPrimary)),
      height: 100,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            reportCheckIcon,
            width: 20,
            height: 30,
            color: AppTheme.buttonActiveColor,
            fit: BoxFit.fitWidth,
            allowDrawingOutsideViewBox: true,
            matchTextDirection: true,
          ),
          Text(
            'Collection Report',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
    var addOrganization = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppTheme.appbarPrimary)),
      height: 100,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            addOrg,
            width: 20,
            height: 30,
            color: AppTheme.buttonActiveColor,
            fit: BoxFit.fitWidth,
            allowDrawingOutsideViewBox: true,
            matchTextDirection: true,
          ),
          Text(
            'Add Organization',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
    var addCom = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppTheme.appbarPrimary)),
      height: 100,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            addCompany,
            width: 20,
            height: 30,
            color: AppTheme.buttonActiveColor,
            fit: BoxFit.fitWidth,
            allowDrawingOutsideViewBox: true,
            matchTextDirection: true,
          ),
          Text(
            'Add Company',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
    var addDoc = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppTheme.appbarPrimary)),
      height: 100,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            addDoctor,
            width: 20,
            height: 30,
            color: AppTheme.buttonActiveColor,
            fit: BoxFit.fitWidth,
            allowDrawingOutsideViewBox: true,
            matchTextDirection: true,
          ),
          Text(
            'Add Doctor',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
    var addUsers = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppTheme.appbarPrimary)),
      height: 100,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            addUser,
            width: 20,
            height: 30,
            color: AppTheme.buttonActiveColor,
            fit: BoxFit.fitWidth,
            allowDrawingOutsideViewBox: true,
            matchTextDirection: true,
          ),
          Text(
            'Add User',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
    var addPat = Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1, color: AppTheme.appbarPrimary)),
      height: 100,
      width: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            addPatient,
            width: 20,
            height: 30,
            color: AppTheme.buttonActiveColor,
            fit: BoxFit.fitWidth,
            allowDrawingOutsideViewBox: true,
            matchTextDirection: true,
          ),
          Text(
            'Add Patient',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    );
    var spaceBetween = SizedBox(
      height: 15,
    );
    var imageDashboard = Container(
        decoration: BoxDecoration(
            color: photo != '' ? Colors.white : AppTheme.appbarPrimary,
            shape: BoxShape.circle,
            border: Border.all(
                color: photo != ''
                    ? AppTheme.buttonActiveColor
                    : Colors.white,
                width: 1)),
        height: isTablet
            ? 32
            : width <= 330
            ? 25
            : 30,
        width: isTablet
            ? 32
            : width <= 330
            ? 25
            : 30,
        child: Center(
          child: photo != ''
              ? companyInfoVm.loadDoctorProfileImage(
              photo,
              isTablet
                  ? 25
                  : width <= 330
                  ? 20
                  : 22,
              isTablet
                  ? 25
                  : width <= 330
                  ? 20
                  : 22,
              50)
              : Image.asset(
            'assets/images/dPro.png',
            height: isTablet
                ? 22
                : width <= 330
                ? 18
                : 20,
            width: isTablet
                ? 22
                : width <= 330
                ? 18
                : 20,
          ),
        ));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          companyInfoVm?.details?.name ?? "",
          style: GoogleFonts.poppins(fontSize: 15),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showAlert(context);
            },
            child: imageDashboard
          ),
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.notes,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: AdminDashboardDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [appointmentReport, collectionreport],
            ),
            spaceBetween,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [addOrganization, addCom],
            ),
            spaceBetween,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                addDoc, addUsers
              ],
            ),
            spaceBetween,
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        PatientPortalUserList()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
               addPat
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showAlert(BuildContext context) {
    // var vm = Provider.of<UserDetailsViewModel>(context, listen: false);
    showDialog(
        context: context,
        builder: (context) => Material(
            color: Colors.transparent, child: ManageAdminProfilePrompt()));
  }
}
