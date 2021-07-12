import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:package_info/package_info.dart';
class AppInfoRepository {
  Future<String> getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
//  print(StringsEn.versionText+": " +version);
    return version;
  }

  Future<PackageInfo> getAppPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }


}

class AppVersionWidgetSmall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppInfoRepository().getAppVersion(),
      builder: (c,snapshot){
        if(snapshot.hasData){
          return Text("Version: ${snapshot.data}",style: TextStyle(color: Colors.grey),);
        }
        return SizedBox();
      },
    );
  }
}

class AppVersionWidgetSmallForSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppInfoRepository().getAppVersion(),
      builder: (c,snapshot){
        if(snapshot.hasData){
          return Text("Version:  ${snapshot.data}",style: GoogleFonts.poppins(color: HexColor("#333132"),fontSize: 15,fontWeight: FontWeight.w600));
        }
        return SizedBox();
      },
    );
  }
}

class AppVersionWidgetLowerCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),

      child: FutureBuilder(
        future: AppInfoRepository().getAppVersion(),
        builder: (c,snapshot){
          if(snapshot.hasData){
            return Text("v${snapshot.data}",style: TextStyle(color: Colors.white, fontSize: isTablet? 20 : 13),);
          }
          return SizedBox();
        },
      ),
    );
  }
}
