import 'package:flutter/material.dart';
import 'package:myhealthbd_app/main_app/views/widgets/page_view_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class NewScreen2 extends StatefulWidget {
  @override
  _NewScreen2State createState() => _NewScreen2State();
}

class _NewScreen2State extends State<NewScreen2> {
  var url= 'https://jobxprss.com/';
  @override
  Widget build(BuildContext context) {
    return PageViewWidget(
      url: url,
      appbar: 'WebView',
      zoom: true,
    );
  }
}
