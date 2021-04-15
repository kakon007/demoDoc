import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {

  static launchFacebookApp(String fbID)async{
    var fbProtocolUrl = "fb://$fbID";
    var fallbackUrl = "https://${StringResources.facebookBaseUrl}$fbID";
    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);
      if (!launched) {
        await launchUrl(fallbackUrl);;
      }
    } catch (e) {
      await launchUrl(fallbackUrl);
    }
  }

  static launchDialer(String number)async{
    launch("tel: $number");
  }

  static launchUrl(String url) async {
    debugPrint("Launching url: $url");
    if(!url.contains('https://', 0)){
      url = 'https://' + url;
    }

    bool _canLaunch = await canLaunch(url);
    if (_canLaunch) {
      launch(url,forceSafariVC: false,forceWebView: false);
    } else {
      BotToast.showText(text: "Unable to launch");
    }
  }
  static sendMail(String email) async {
//    debugPrint("Launching url: $email");

    bool _canLaunch = await canLaunch("mailto:$email");
    if (_canLaunch) {
      launch("mailto:$email");

    } else {
      BotToast.showText(text: "Unable to launch");
    }
  }
}
