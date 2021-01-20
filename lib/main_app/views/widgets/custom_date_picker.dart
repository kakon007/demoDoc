// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
// import 'package:myhealthbd_app/main_app/util/date_format_util.dart';
//
// class CommonDatePickerFormField extends StatefulWidget {
//   final String label;
//   final String errorText;
//   final DateTime date;
//   final Function(DateTime) onDateTimeChanged;
//   final Function onTapDateClear;
//   final DateTime minDate;
//   final DateTime maxDate;
//   final FocusNode focusNode;
//   final bool isRequired;
//   final Key dateFieldKey;
//   final FormFieldValidator<DateTime> validator;
//
//   const CommonDatePickerFormField(
//       {@required this.label,
//         @required this.date,
//         @required this.onDateTimeChanged,
//         this.onTapDateClear,
//         this.maxDate,
//         this.validator,
//         this.minDate,
//         this.errorText,
//         this.focusNode,
//         this.isRequired = false,
//         this.dateFieldKey});
//
//   @override
//   _CommonDatePickerFormFieldState createState() =>
//       _CommonDatePickerFormFieldState();
// }
//
// class _CommonDatePickerFormFieldState extends State<CommonDatePickerFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
// //        SizedBox(height: 16),
// //        Text(
// //          "",
// //          textAlign: TextAlign.left,
// //          style: TextStyle(fontWeight: FontWeight.bold),
// //        ),
// //        SizedBox(
// //          height: 8,
// //        ),
//
//         CustomTextield(
//           errorText: widget.errorText,
//           validator: (v) {
//             if (widget.validator != null) {
//               return widget.validator(widget.date);
//             } else if (widget.isRequired) {
//               return Validator().nullFieldValidate(v);
//             } else {
//               return null;
//             }
//           },
//           isRequired: widget.isRequired,
//           labelText: widget.label,
//           textFieldKey: widget.dateFieldKey,
//           onTap: () {
//             FocusScopeNode currentFocus = FocusScope.of(context);
//             currentFocus?.unfocus();
//             _showCupertinoDatePicker(context);
// //            Theme.of(context).platform == TargetPlatform.iOS
// //                ?
// //            _showCupertinoDatePicker(context):
// //            _showDatePicker(context);
// //            _selectDateAndroid(context);
//           },
//           readOnly: true,
//           focusNode: widget.focusNode,
//           controller: TextEditingController()
//             ..text = widget.date != null
//                 ? DateFormatUtil.formatDate(widget.date)
//                 : "",
//           hintText: StringResources.chooseDateText,
//         ),
//       ],
//     );
//   }
//
//   _showCupertinoDatePicker(context) {
//     var _miniDate =
//         widget.maxDate ?? DateTime.now().subtract(Duration(days: 360 * 100));
//     var _maxDate =
//         widget.minDate ?? DateTime.now().add(Duration(days: 360 * 10));
//
//     showDialog(
//         context: context,
//         builder: (context) {
//           return Center(
//             child: Container(
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width / 1.3,
//               child: Material(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Expanded(
//                       child: CupertinoTheme(
//                         data: CupertinoThemeData(
//                             brightness: Theme.of(context).brightness),
//                         child: CupertinoDatePicker(
//                           key: Key("datePickerKey"),
//                           maximumDate: _maxDate,
//                           minimumDate: _miniDate,
//                           initialDateTime: widget.date ?? DateTime.now(),
//                           mode: CupertinoDatePickerMode.date,
//                           onDateTimeChanged: (v) {
//                             if (v.year >= _miniDate.year &&
//                                 v.year <= _maxDate.year) {
//                               widget.onDateTimeChanged(v);
//                             }
//                           },
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: FlatButton(
//                           key: Key("doneButtonKey"),
//                           color: Theme.of(context).primaryColor,
//                           child: Icon(
//                             Icons.done,
//                           ),
//                           onPressed: () {
//                             widget.onDateTimeChanged(
//                                 widget.date ?? DateTime.now());
//                             Navigator.pop(context);
//                           }),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
//
//   _selectDateAndroid(BuildContext context) async {
//     var _miniDate =
//         widget.maxDate ?? DateTime.now().subtract(Duration(days: 360 * 100));
//     var _maxDate =
//         widget.minDate ?? DateTime.now().add(Duration(days: 360 * 10));
//     showDatePicker(
//       firstDate: _miniDate,
//       initialDate: widget.date ?? DateTime.now(),
//       lastDate: _maxDate,
//       context: context,
//     ).then((value) {
//       widget.onDateTimeChanged(value);
//     });
//   }
//
//   _showDatePicker(context) {
//     var _miniDate =
//         widget.maxDate ?? DateTime.now().subtract(Duration(days: 360 * 100));
//     var _maxDate =
//         widget.minDate ?? DateTime.now().add(Duration(days: 360 * 10));
//
//     showDialog(
//         context: context,
//         builder: (context) {
//           return Center(
//             child: Container(
//               height: MediaQuery.of(context).size.height / 2,
//               width: MediaQuery.of(context).size.width / 1.3,
//               child: Material(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Expanded(
//                       child: CalendarDatePicker(
//                         lastDate: _maxDate,
//                         firstDate: _miniDate,
//                         initialDate: widget.date ?? DateTime.now(),
//                         onDateChanged: (v) {
//                           if (v.year >= _miniDate.year &&
//                               v.year <= _maxDate.year) {
//                             widget.onDateTimeChanged(v);
//                           }
//                         },
//                       ),
//                     ),
//                     InkWell(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Icon(
//                             Icons.done,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                         ),
//                         onTap: () {
//                           widget
//                               .onDateTimeChanged(widget.date ?? DateTime.now());
//                           Navigator.pop(context);
//                         }),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         });
//   }
// }
