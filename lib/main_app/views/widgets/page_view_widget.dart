// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import 'custom_loader.dart';
//
// class PageViewWidget extends StatefulWidget {
//   final String url;
//
//   PageViewWidget({Key key, @required this.url}) : super(key: key);
//
//   @override
//   _PageViewWidgetState createState() => _PageViewWidgetState();
// }
//
// class _PageViewWidgetState extends State<PageViewWidget> {
//   bool isLoading = true;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Stack(
//       children: [
//         WebView(
//           initialUrl: widget.url, javascriptMode: JavascriptMode.unrestricted,
//           onPageFinished: (v) {
//             setState(() {
//               isLoading = false;
//             });
//           },
//         ),
//         isLoading ? Center(child: CustomLoader()) : Container(),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'custom_loader.dart';

class PageViewWidget extends StatefulWidget {
  final String url;
  final String appbar;
  bool zoom;

  PageViewWidget({Key key, @required this.url, this.appbar, this.zoom}) : super(key: key);

  @override
  _PageViewWidgetState createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        WebviewScaffold(
          appBar: AppBar(
            title: Text(widget.appbar),
          ),
          url: widget.url,
          withZoom: widget.zoom,

          // onPageFinished: (v) {
          //   setState(() {
          //     isLoading = false;
          //   });
          // },
        ),
        isLoading ? Center(child: CustomLoader()) : Container(),
      ],
    );
  }
}