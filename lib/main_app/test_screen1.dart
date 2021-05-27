// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/custom_zefyr_rich_text_from_field.dart';
// import 'package:quill_delta/quill_delta.dart';
// import 'package:zefyr/zefyr.dart';
//
// class MyScreen extends StatefulWidget {
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }
//
// class _MyScreenState extends State<MyScreen> {
//   Widget spaceBetweenSections = SizedBox(height: 30);
//   ZefyrController controller;
//   final focusNode = FocusNode();
//
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     final document = loadDocument();
//     controller = ZefyrController(document);
//   }
//
//   NotusDocument loadDocument(){
//     final Delta delta = Delta()..insert('Test text\n');
//     return NotusDocument.fromDelta(delta);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Test Screen"),
//       ),
//       body: Container(
//         child: ZefyrScaffold(
//           child: CustomZefyrRichTextFormField(
//             labelText: 'Demo Label',
//             controller: controller,
//             focusNode: focusNode,
//           ),
//         ),
//       ),
//     );
//   }
// }
