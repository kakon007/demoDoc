import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/appointments/view_model/available_slot_view_model.dart';
import 'package:myhealthbd_app/features/book_test/view/widgets/add_patient_book_test.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

import '../order_confirm_view_model.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({Key key}) : super(key: key);

  @override
  _OrderConfirmationState createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var vm = Provider.of<AvailableSlotsViewModel>(context, listen: true);
    var orderVm = Provider.of<OrderConfirmViewModel>(context, listen: true);
    var selectType = Padding(
      padding:
      EdgeInsets.only(left: isTablet ? 15 : 0, right: isTablet ? 15 : 0),
      child: Container(
        height: isTablet ? 90 : 65.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: HexColor("#E9ECFE"),
            borderRadius: BorderRadius.circular(13)),
        child: Padding(
          padding: EdgeInsets.only(
              left: isTablet ? 30 : 10.0, right: isTablet ? 30 : 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: HexColor(orderVm.forMeBackColor),
                      borderRadius: BorderRadius.circular(10)),
                  height:
                  isTablet ? 60 : MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * .4,
                  child: Center(
                      child: Text(
                        "For Me",
                        key: Key('forMeKey'),
                        style: GoogleFonts.poppins(
                            fontSize: isTablet ? 20 : 15,
                            color: HexColor(orderVm.forMeTextColor)),
                      )),
                ),
                onTap: () {
                  orderVm.getAppointType(true, false);
                  if (orderVm.addPatient == false) {
                    orderVm.getButtonColor(
                        "#141D53", "#FFFFFF", "#00FFFFFF", "#8389A9");
                  }
                  print(orderVm.forMeBackColor);
                },
              ),
              InkWell(
                child: Container(
                    decoration: BoxDecoration(
                        color: HexColor(orderVm.addPatientBackColor),
                        borderRadius: BorderRadius.circular(10)),
                    height: isTablet
                        ? 65
                        : MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * .4,
                    child: Center(
                        child: Text(
                          "Add patient",
                          key: Key('addPatientKey'),
                          style: GoogleFonts.poppins(
                              fontSize: isTablet ? 20 : 15,
                              color: HexColor(orderVm.addPatientTextColor)),
                        ))),
                onTap: () {
                  orderVm.getAppointType(false, true);
                  if (orderVm.forMe == false) {
                    orderVm.getButtonColor(
                        "#00FFFFFF", "#8389A9", "#141D53", "#FFFFFF");
                  }
                  print(orderVm.forMeBackColor);
                },
              )
            ],
          ),
        ),
      ),
    );
    var spaceBetween = SizedBox(height: 10,);
    return Scaffold(
      appBar: AppBar(title: Text('Order Confirmation'),
      backgroundColor: AppTheme.appbarPrimary,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          spaceBetween,
          selectType,
          orderVm.forMe? SizedBox() : ForMeBookTest()
        ],
      ),
    );
  }
}
