import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/doctor/main_app/views/doctor_form_field.dart';
import 'package:myhealthbd_app/features/auth/view_model/app_navigator.dart';
import 'package:myhealthbd_app/features/book_test/view/widgets/add_more_information.dart';
import 'package:myhealthbd_app/features/book_test/view_model/order_confirm_view_model.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:provider/provider.dart';

class OrderConfirmationAfterSignIn extends StatefulWidget {
  @override
  _OrderConfirmationAfterSignInState createState() =>
      _OrderConfirmationAfterSignInState();
}

class _OrderConfirmationAfterSignInState
    extends State<OrderConfirmationAfterSignIn> {
  // var width = MediaQuery.of(context).size.width;
  bool isCheckReg = false;
  bool isCheckSample = false;
  String _chosenValue;
  String _chosenGender;
  DateTime selectedDate = DateTime.now();

  int valOne = 1;

  @override
  Widget build(BuildContext context) {
    var cartVM =
        Provider.of<OrderConfirmViewModel>(appNavigator.context, listen: false);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    String _formatDate = DateFormat("dd/MM/yyyy").format(selectedDate);
    Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1800, 1),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          cartVM.saveOrderConfirmDataData(selectedDate: selectedDate);
          var formattedDate = "${picked.year}-${picked.month}-${picked.day}";
          cartVM.date.value =
              TextEditingValue(text: "${formattedDate.toString()}");
        });
    }

    Future<Null> _preferredDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2050, 1));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          cartVM.saveOrderConfirmDataData(preferredDate: selectedDate);
          var formattedDate = "${picked.year}-${picked.month}-${picked.day}";
          cartVM.preferredDate.value =
              TextEditingValue(text: "${formattedDate.toString()}");
        });
    }

    Future<Null> _expectedDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime.now(),
          lastDate: DateTime(2050, 1));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
          cartVM.saveOrderConfirmDataData(expectedDate: selectedDate);
          var formattedDate = "${picked.year}-${picked.month}-${picked.day}";
          cartVM.expectedDate.value =
              TextEditingValue(text: "${formattedDate.toString()}");
        });
    }

    var username = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Username',
      minimizeBottomPadding: true,
      controller: cartVM.username,
    );
    var password = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      hintText: 'Password',
      minimizeBottomPadding: true,
      controller: cartVM.password,
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
    var saveButton = Padding(
      padding: EdgeInsets.all(6),
      child: FlatButton(
          height: 45,
          minWidth: isTablet
              ? MediaQuery.of(context).size.width * .4
              : MediaQuery.of(context).size.width * .3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Color(0xff354291),
          onPressed: () async {
            cartVM.saveOrderConfirmDataData();
          },
          child: Text(
            'Save',
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
    var closeButton = Padding(
      padding: EdgeInsets.all(6),
      child: FlatButton(
          height: 45,
          minWidth: isTablet
              ? MediaQuery.of(context).size.width * .4
              : MediaQuery.of(context).size.width * .3,
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          shape: new RoundedRectangleBorder(
              side: BorderSide(
                  color: Color(0xff354291), width: 1, style: BorderStyle.solid),
              borderRadius: new BorderRadius.circular(5.0)),
          onPressed: () async {},
          child: Text(
            'Close',
            style: GoogleFonts.roboto(
                color: Color(0xff354291),
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
            cartVM.saveOrderConfirmDataData(salutation: _chosenValue);
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
            cartVM.saveOrderConfirmDataData(gender: _chosenGender);
            print(_chosenGender);
          });
        },
      ),
    );

    var salutation = Container(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Column(
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
      ),
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
                margin: EdgeInsets.only(bottom: 20),
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
    var firstName = Container(
        width: MediaQuery.of(context).size.width * 0.57,
        child: SignUpFormField(
          labelText: 'First Name',
          isRequired: true,
          hintSize: isTablet ? 17 : 12,
          hintText: 'Username',
          minimizeBottomPadding: true,
          controller: cartVM.firstNameController,
        ));
    var lastName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      labelText: 'Last Name',
      hintText: 'Last Name',
      minimizeBottomPadding: true,
      controller: cartVM.lastNameController,
    );
    var width = MediaQuery.of(context).size.width;
    var birthDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('Birth Date'),
          ),
          Container(
            height: 45.0,
            margin: EdgeInsets.only(bottom: 15),
            width: isTablet
                ? width * .94
                : width <= 330
                    ? MediaQuery.of(context).size.width * .87
                    : MediaQuery.of(context).size.width * .6,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#808080")),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$_formatDate",
                    style: GoogleFonts.poppins(
                        color: AppTheme.signInSignUpColor,
                        fontSize: isTablet ? 18 : 13.0),
                  ),
                  Container(
                      height: 25,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: HexColor("#808080"),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        _selectDate(context);
        print(_selectDate(context));
      },
    );
    var mobileNumber = SignUpFormField(
      isRequired: true,
      labelText: 'Mobile',
      hintSize: isTablet ? 17 : 12,
      hintText: 'mobile Number',
      minimizeBottomPadding: true,
      controller: cartVM.mobileNumberController,
    );
    var address = SignUpFormField(
      labelText: 'Address',
      hintSize: isTablet ? 17 : 12,
      hintText: 'Address',
      minimizeBottomPadding: true,
      controller: cartVM.addressController,
    );
    var age = Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Age',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      bottom: 20,
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 20,
                      child: Icon(
                        Icons.remove,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: SignUpFormField(
                        hintSize: isTablet ? 17 : 12,
                        hintText: 'year',
                        minimizeBottomPadding: true,
                        leftContentPadding: 30,
                        controller: cartVM.yearController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      bottom: 20,
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 20,
                      child: Icon(
                        Icons.remove,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: SignUpFormField(
                        hintSize: isTablet ? 17 : 12,
                        leftContentPadding: 30,
                        hintText: 'Month',
                        minimizeBottomPadding: true,
                        controller: cartVM.monthController,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.28,
                child: Stack(
                  children: [
                    Positioned(
                      left: 10,
                      bottom: 20,
                      child: Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 20,
                      child: Icon(
                        Icons.remove,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: SignUpFormField(
                        hintSize: isTablet ? 17 : 12,
                        hintText: 'Day',
                        leftContentPadding: 30,
                        minimizeBottomPadding: true,
                        controller: cartVM.dayController,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
    var fatherName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      labelText: 'Father Name',
      hintText: 'Father Name',
      minimizeBottomPadding: true,
      controller: cartVM.fathersName,
      fillColor: "#FFFFFF",
      isFilled: true,
    );
    var mothersName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      labelText: 'Mother Name',
      hintText: 'Mother Name',
      minimizeBottomPadding: true,
      fillColor: "#FFFFFF",
      isFilled: true,
      controller: cartVM.mothersName,
    );
    var bloodGroupAndMarital = Padding(
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Blood Group',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                child: TypeAheadFormField<String>(
                  textFieldConfiguration: TextFieldConfiguration(
                      style: TextStyle(fontSize: isTablet ? 18 : 16),
                      textInputAction: TextInputAction.search,
                      controller: cartVM.bloodController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Select One",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down,
                                size: isTablet ? 30 : 25,
                                color: AppTheme.buttonActiveColor)),
                      )),
                  itemBuilder: (_, v) {
                    return Padding(
                      padding: EdgeInsets.all(isTablet ? 12 : 10),
                      child: Text(
                        "$v",
                        style: TextStyle(fontSize: isTablet ? 18 : 16),
                      ),
                    );
                  },
                  onSuggestionSelected: (v) {
                    setState(() {});
                  },
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suggestionsCallback: (v) {},
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Marital Status',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: 50,
                child: TypeAheadFormField<String>(
                  textFieldConfiguration: TextFieldConfiguration(
                      style: TextStyle(fontSize: isTablet ? 18 : 16),
                      textInputAction: TextInputAction.search,
                      controller: cartVM.maritalStatusController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Select One",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down,
                                size: isTablet ? 30 : 25,
                                color: AppTheme.buttonActiveColor)),
                      )),
                  itemBuilder: (_, v) {
                    return Padding(
                      padding: EdgeInsets.all(isTablet ? 12 : 10),
                      child: Text(
                        "$v",
                        style: TextStyle(fontSize: isTablet ? 18 : 16),
                      ),
                    );
                  },
                  onSuggestionSelected: (v) {
                    setState(() {});
                  },
                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suggestionsCallback: (v) {
                    // return PreDiagnosisSearchRepository().fetchSearchList(
                    //     q: v,
                    //     favoriteType:
                    //     PrescriptionFavouriteType.chiefComplaint.toString());
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
    var spouseName = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      labelText: 'Spouse Name',
      hintText: 'Spouse Name',
      minimizeBottomPadding: true,
      fillColor: '#FFFFFF',
      isFilled: true,
      controller: cartVM.spouseController,
    );
    var religion = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      labelText: 'Religion',
      hintText: 'Religion',
      minimizeBottomPadding: true,
      fillColor: '#FFFFFF',
      isFilled: true,
      controller: cartVM.religionController,
    );
    var email = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      labelText: 'Email',
      hintText: 'Email',
      fillColor: '#FFFFFF',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: cartVM.emailController,
    );
    var nationalId = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      labelText: 'National ID',
      hintText: 'National ID',
      minimizeBottomPadding: true,
      fillColor: '#FFFFFF',
      isFilled: true,
      controller: cartVM.nidController,
    );
    var passport = SignUpFormField(
      hintSize: isTablet ? 17 : 12,
      labelText: 'Passport',
      hintText: 'Passport',
      fillColor: '#FFFFFF',
      isFilled: true,
      minimizeBottomPadding: true,
      controller: cartVM.passportController,
    );
    var preferredDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('Preferred Sample Date'),
          ),
          Container(
            height: 45.0,
            margin: EdgeInsets.only(bottom: 15),
            width: isTablet
                ? width * .94
                : width <= 330
                    ? MediaQuery.of(context).size.width * .87
                    : MediaQuery.of(context).size.width * .45,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#808080")),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$_formatDate",
                    style: GoogleFonts.poppins(
                        color: AppTheme.signInSignUpColor,
                        fontSize: isTablet ? 18 : 13.0),
                  ),
                  Container(
                      height: 25,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: HexColor("#808080"),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        _preferredDate(context);
      },
    );
    var expectedDate = GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text('Expected Report Date'),
          ),
          Container(
            height: 45.0,
            margin: EdgeInsets.only(bottom: 15),
            width: isTablet
                ? width * .94
                : width <= 330
                    ? MediaQuery.of(context).size.width * .87
                    : MediaQuery.of(context).size.width * .45,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: HexColor("#808080")),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$_formatDate",
                    style: GoogleFonts.poppins(
                        color: AppTheme.signInSignUpColor,
                        fontSize: isTablet ? 18 : 13.0),
                  ),
                  Container(
                      height: 25,
                      child: Icon(
                        Icons.calendar_today_outlined,
                        color: HexColor("#808080"),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        _expectedDate(context);
      },
    );
    var tentativeVisitDate = SignUpFormField(
      isRequired: true,
      hintSize: isTablet ? 17 : 12,
      labelText: 'Tentative Visit Date',
      hintText: 'Tentative Visit Date',
      minimizeBottomPadding: true,
      controller: cartVM.tentativeVisitDateController,
    );
    var ticketNumber = SignUpFormField(
      isRequired: true,
      hintSize: isTablet ? 17 : 12,
      labelText: 'Ticket Number',
      hintText: 'Ticket Number',
      minimizeBottomPadding: true,
      controller: cartVM.ticketNumberController,
    );
    var countryOfArrival = SignUpFormField(
      isRequired: true,
      hintSize: isTablet ? 17 : 12,
      labelText: 'Country of Arrival',
      hintText: 'Country of Arrival',
      minimizeBottomPadding: true,
      controller: cartVM.countryArrivalController,
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
              isCheckReg
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        username,
                        SizedBox(
                          height: 10,
                        ),
                        password,
                        verifyButton,
                      ],
                    )
                  : SizedBox(),
              Row(
                children: [
                  salutation,
                  firstName,
                ],
              ),
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
              SizedBox(
                height: 15,
              ),
              age,
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
              SizedBox(
                height: 20,
              ),
              //add more info section
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0XFFEFF5FF)),
                child: AddMoreWidget(
                  controller: expandableControllers.addMoreController,
                  onChangeShowReport: (bool val) {
                    // templateVm.disposalShowReport = val;
                    setState(() {});
                  },
                  title: "Add more information",
                  expandedWidget: Container(
                    decoration: BoxDecoration(
                        color: Color(0XFFEFF5FF),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        border: Border.all(color: Color(0XFFEFF5FF), width: 2)),
                    child: Column(
                      children: [
                        fatherName,
                        SizedBox(
                          height: 10,
                        ),
                        mothersName,
                        SizedBox(
                          height: 10,
                        ),
                        bloodGroupAndMarital,
                        SizedBox(
                          height: 10,
                        ),
                        email,
                        SizedBox(
                          height: 10,
                        ),
                        nationalId,
                        SizedBox(
                          height: 10,
                        ),
                        passport,
                        SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [preferredDate, expectedDate],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Foreign Traveler'),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: valOne,
                            onChanged: (value) {
                              setState(() {
                                valOne = value;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          Text('Yes')
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: valOne,
                            onChanged: (value) {
                              setState(() {
                                valOne = value;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                          Text('No')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              valOne == 0
                  ? Column(
                      children: [
                        tentativeVisitDate,
                        SizedBox(
                          height: 10,
                        ),
                        ticketNumber,
                        SizedBox(
                          height: 10,
                        ),
                        countryOfArrival,
                      ],
                    )
                  : SizedBox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  closeButton,
                  SizedBox(
                    width: 20,
                  ),
                  saveButton,
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'By Clicking the save button, you agree to our',
                      style: TextStyle(color: Colors.indigo),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Terms of Services and Privacy Policy',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF354291)),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
