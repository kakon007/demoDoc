import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';

class OrderConfirmationAfterSignIn extends StatefulWidget {
  @override
  _OrderConfirmationAfterSignInState createState() =>
      _OrderConfirmationAfterSignInState();
}

class _OrderConfirmationAfterSignInState
    extends State<OrderConfirmationAfterSignIn> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _date = new TextEditingController();
  // var width = MediaQuery.of(context).size.width;
  bool isCheckReg = false;
  bool isCheckSample = false;
  String _chosenValue;
  String _chosenGender;
  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2050, 1));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var formattedDate = "${picked.year}-${picked.month}-${picked.day}";
        _date.value = TextEditingValue(text: "${formattedDate.toString()}");
      });
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    var username = DoctorFormField(
      enabledBorderColor: "#D2D2D2",
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      hintText: 'Username',
      minimizeBottomPadding: true,
      controller: _username,
    );
    var password = DoctorFormField(
      enabledBorderColor: "#D2D2D2",
      topContentPadding: isTablet ? 30 : 25,
      hintSize: isTablet ? 17 : 12,
      hintText: 'Password',
      minimizeBottomPadding: true,
      controller: _password,
    );
    var verifyButton = Padding(
      padding: EdgeInsets.all(6),
      child: FlatButton(
          height: 40,
          minWidth: isTablet
              ? MediaQuery.of(context).size.width * .4
              : MediaQuery.of(context).size.width * .3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Color(0xff354291),
          onPressed: () async {},
          child: Text(
            'VERIFY',
            style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: isTablet
                    ? 17
                    : MediaQuery.of(context).size.width <= 330
                        ? 12
                        : 15,
                fontWeight: FontWeight.w600),
          )),
    );
    var selectDuration = DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        value: _chosenValue,
        //elevation: 5,
        style: TextStyle(color: Colors.black),
        items: <String>[
          'Mr',
          'Msc',
          'Other',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: isMobile ? 14 : 18),
            ),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "Select",
            style: TextStyle(
                color: Colors.grey,
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        onChanged: (String value) {
          setState(() {
            _chosenValue = value;
          });
        },
      ),
    );
    var selectGender = DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        value: _chosenGender,
        //elevation: 5,
        style: TextStyle(color: Colors.black),
        items: <String>[
          'Male',
          'Female',
          'Other',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: isMobile ? 14 : 18),
            ),
          );
        }).toList(),
        hint: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "Select",
            style: TextStyle(
                color: Colors.grey,
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        onChanged: (String value) {
          setState(() {
            _chosenGender = value;
          });
        },
      ),
    );

    var salutation = Column(
      // mainAxisAlignment: MainAxisAlignment.start
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Text('Salutation'),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: selectDuration,
                ),
              ),
            ],
          ),
        )
      ],
    );
    var gender = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Text('Gender'),
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.27,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: selectGender,
                ),
              ),
            ],
          ),
        )
      ],
    );
    var firstName = Padding(
      padding: const EdgeInsets.only(left: 10),
      child: SignUpFormField(
        labelText: 'First Name',
        isRequired: true,
        hintSize: isTablet ? 17 : 12,
        hintText: 'Username',
        minimizeBottomPadding: true,
        controller: _username,
      ),
    );
    var lastName = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Last Name'),
        ),
        SizedBox(
          height: 5,
        ),
        DoctorFormField(
          enabledBorderColor: "#D2D2D2",
          topContentPadding: isTablet ? 30 : 25,
          hintSize: isTablet ? 17 : 12,
          hintText: 'Last Name',
          minimizeBottomPadding: true,
          controller: _password,
        ),
      ],
    );
    var birthDate = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Birth Date'),
        SizedBox(
          height: 5,
        ),
        InkWell(
          onTap: () => _selectDate(context),
          child: Container(
            width: MediaQuery.of(context).size.width * .6,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: AbsorbPointer(
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.date_range_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                    child: TextField(
                      controller: _date,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Duration',
                          // isDense: true,
                          labelStyle: TextStyle(fontSize: isMobile ? 14 : 18)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
    var mobileNumber = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Mobile'),
        ),
        SizedBox(
          height: 5,
        ),
        DoctorFormField(
          enabledBorderColor: "#D2D2D2",
          topContentPadding: isTablet ? 30 : 25,
          hintSize: isTablet ? 17 : 12,
          hintText: 'mobile Number',
          minimizeBottomPadding: true,
          controller: _password,
        ),
      ],
    );
    var address = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Address'),
        ),
        SizedBox(
          height: 5,
        ),
        DoctorFormField(
          enabledBorderColor: "#D2D2D2",
          topContentPadding: isTablet ? 30 : 25,
          hintSize: isTablet ? 17 : 12,
          hintText: 'Address',
          minimizeBottomPadding: true,
          controller: _password,
        ),
      ],
    );
    var age = Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 40,
              child: DoctorFormField(
                enabledBorderColor: "#D2D2D2",
                topContentPadding: isTablet ? 30 : 25,
                hintSize: isTablet ? 17 : 12,
                hintText: 'Username',
                minimizeBottomPadding: true,
                controller: _username,
              )),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: DoctorFormField(
                enabledBorderColor: "#D2D2D2",
                topContentPadding: isTablet ? 30 : 25,
                hintSize: isTablet ? 17 : 12,
                hintText: 'Username',
                minimizeBottomPadding: true,
                controller: _username,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 40,
            child: AbsorbPointer(
              child: Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Icon(
                      Icons.date_range_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Center(
                    child: SignUpFormField(
                      hintSize: isTablet ? 17 : 12,
                      hintText: 'Username',
                      minimizeBottomPadding: true,
                      controller: _username,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#354291'),
        title: Text(StringResources.orderConfirmation),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CheckboxListTile(
                activeColor: Colors.indigo,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  "I am a registered Patient ?",
                  style: TextStyle(
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.w500),
                ),
                value: isCheckReg,
                onChanged: (val) {
                  isCheckReg = val;
                  setState(() {});
                },
              ),
              username,
              SizedBox(
                height: 10,
              ),
              password,
              verifyButton,
              firstName,
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [salutation, firstName],
              // ),
              SizedBox(
                height: 10,
              ),
              lastName,
              SizedBox(
                height: 10,
              ),
              Row(
                children: [gender, birthDate],
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // age,
              SizedBox(
                height: 10,
              ),
              mobileNumber,
              SizedBox(
                height: 10,
              ),
              address,
              CheckboxListTile(
                activeColor: Colors.indigo,
                controlAffinity: ListTileControlAffinity.leading,
                title: Text(
                  "Home Sample Collection",
                  style: TextStyle(
                      fontSize: isTablet ? 18 : 16,
                      fontWeight: FontWeight.w500),
                ),
                value: isCheckSample,
                onChanged: (val) {
                  isCheckSample = val;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
