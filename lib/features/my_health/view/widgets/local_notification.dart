import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:myhealthbd_app/main_app/resource/colors.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:open_file/open_file.dart';

class LocalNotification{
  static final channelId = "${StringResources.appName.replaceAll(" ", "")}";
  static final channelName = "${StringResources.appName}";
  static final channelDescription = "${StringResources.appName} Notification";
  static final compressionProgressNotificationId = 15;
  static final compressionFinishedNotificationId = 16;
  bool _isInitialized = false;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  initializeIfNeeded() async {
    if (!_isInitialized) {
      print('Local');
      await Future.delayed(Duration(seconds: 1));
      const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('notification_icon');
      final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);
      final MacOSInitializationSettings initializationSettingsMacOS = MacOSInitializationSettings();
      final InitializationSettings initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
          macOS: initializationSettingsMacOS);
      await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onSelectNotification: _selectNotification);
      _isInitialized = true;
      return;
    } else {
      return;
    }
  }

  Future _selectNotification(String payload) async {
    if (payload != null) {
      print('notification payload: $payload');
      var decodedPayload = json.decode(payload);

      if (decodedPayload['type'] == "OPEN_FILE") {
        if (decodedPayload["data"] != null) {
          if (decodedPayload["data"]["filePath"] != null) {
            String path = "${decodedPayload["data"]["filePath"]}";
            print(path);
            OpenFile.open(path);
          }
        }
      }
    }
  }

  showNotification(String title, String body, {String payload}) {
    var notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelName,
          channelDescription,
          color: AppTheme.appbarPrimary,
        ));
    _flutterLocalNotificationsPlugin.show(
        compressionFinishedNotificationId, title, body, notificationDetails,
        payload: payload);
  }


  Future<void> closeProgressNotification() {
    return _flutterLocalNotificationsPlugin.cancel(compressionProgressNotificationId);
  }

  Future<void> closeCompressFinishedNotification() {
    return _flutterLocalNotificationsPlugin.cancel(compressionFinishedNotificationId);
  }

  Future onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: Get.context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
            },
          )
        ],
      ),
    );
  }
}