import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/prescription_common_widget.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/vitals_field.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view/widgets/vitals_text_form_field.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/chief_complaint_view_model.dart';
import 'package:myhealthbd_app/doctor/features/prescription_module/view_models/get_template_data_view_model.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:provider/provider.dart';

class VitalsWidget extends StatefulWidget {
  const VitalsWidget({Key key}) : super(key: key);

  @override
  _VitalsWidgetState createState() => _VitalsWidgetState();
}

class _VitalsWidgetState extends State<VitalsWidget> {
  bool showReport = false;
  TextEditingController controller = TextEditingController();
  List<String> chiefComplaintSelectedItems = [];

  @override
  Widget build(BuildContext context) {
    var templateVm =
        Provider.of<GetTamplateDataViewModel>(context, listen: true);

    bool isTablet = Responsive.isTablet(context);
    var vm = context.watch<ChiefComplaintViewModel>();
    var spaceBetween = SizedBox(
      height: 10,
    );
    var bodyTemperature = VitalsTextField(
      levelText: 'Body Temperature',
      unitName: 'Fahrenheit',
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      unitSize: isTablet ? 17 : 12,
      unitHeight: isTablet ? 60 : 46,
      unitWidth: isTablet ? 100 : 80,
      controller: templateVm.tempTextEditingController,
    );
    var pulse = VitalsField(
      enabledBorderColor: "#D2D2D2",
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      labelText: 'Pulse',
      minimizeBottomPadding: true,
      controller: templateVm.pulseTextEditingController,
    );
    var heartRate = VitalsField(
      enabledBorderColor: "#D2D2D2",
      labelText: 'Heart Rate',
      minimizeBottomPadding: true,
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      controller: templateVm.heartRateTextEditingController,
    );
    var sp02 = VitalsField(
      enabledBorderColor: "#D2D2D2",
      labelText: 'SP02',
      minimizeBottomPadding: true,
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      controller: templateVm.spo2TextEditingController,
    );
    var resRate = VitalsTextField(
      levelText: 'Res.Rate',
      unitName: 'Min.',
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      unitSize: isTablet ? 17 : 12,
      unitHeight: isTablet ? 60 : 46,
      unitWidth: isTablet ? 100 : 80,
      controller: templateVm.resRateTextEditingController,
    );
    var bpSys = VitalsTextField(
      levelText: 'BP Sys',
      unitName: 'mmHg',
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      unitSize: isTablet ? 17 : 12,
      unitHeight: isTablet ? 60 : 46,
      unitWidth: isTablet ? 100 : 80,
      controller: templateVm.bpSysTextEditingController,
    );
    var bpDia = VitalsTextField(
      levelText: 'BP Dia',
      unitName: 'mmHg',
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      unitSize: isTablet ? 17 : 12,
      unitHeight: isTablet ? 60 : 46,
      unitWidth: isTablet ? 100 : 80,
      controller: templateVm.bpDiaTextEditingController,
    );
    var minBp = VitalsTextField(
      levelText: 'Min BP',
      unitName: 'mmHg',
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      unitSize: isTablet ? 17 : 12,
      unitHeight: isTablet ? 60 : 46,
      unitWidth: isTablet ? 100 : 80,
      controller: templateVm.minBpTextEditingController,
    );
    var weight = VitalsTextField(
      levelText: 'Weight',
      unitName: 'Kg',
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      unitSize: isTablet ? 17 : 12,
      unitHeight: isTablet ? 60 : 46,
      unitWidth: isTablet ? 100 : 80,
      controller: templateVm.weightTextEditingController,
    );
    var height = VitalsTextField(
      levelText: 'Height',
      unitName: 'cm',
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      unitHeight: isTablet ? 60 : 46,
      unitWidth: isTablet ? 100 : 80,
      unitSize: isTablet ? 17 : 12,
      controller: templateVm.heightTextEditingController,
    );
    // personalInfoVm.isPersonalInfoEditing?

    return PrescriptionCommonWidget(
      controller: expandableControllers.vitalsController,
      onChangeShowReport: (bool val) {
        templateVm.vitalsShowReport = val;
        setState(() {});
      },
      isFixed: true,
      showReport: templateVm.vitalsShowReport,
      title: "Vitals",
      expandedWidget: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: Color(0xffD2D2D2), width: 2)),
        child: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10, left: 5, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bodyTemperature,
              spaceBetween,
              pulse,
              spaceBetween,
              heartRate,
              spaceBetween,
              sp02,
              spaceBetween,
              resRate,
              spaceBetween,
              bpSys,
              spaceBetween,
              bpDia,
              spaceBetween,
              minBp,
              spaceBetween,
              weight,
              spaceBetween,
              height
            ],
          ),
        ),
      ),
    );
  }
}
