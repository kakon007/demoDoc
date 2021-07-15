import 'package:flutter/material.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

enum Flavor { DEV, QA, PRODUCTION }

class FlavorValues {
  // FlavorValues({@required this.baseUrl});

  //final String baseUrl;
//Add other flavor specific values, e.g database name
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues values;
  static FlavorConfig _instance;

  factory FlavorConfig({
    @required Flavor flavor,
    Color color: Colors.blue,
    FlavorValues values,
  }) {
    _instance ??=
        FlavorConfig._internal(flavor, StringResources.enumName(flavor.toString()), color, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.values);

  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;

  static bool isDevelopment() => _instance.flavor == Flavor.DEV;

  static bool isQA() => _instance.flavor == Flavor.QA;

  static String appName() {
    if (_instance.flavor == Flavor.QA) {
      return StringResources.appNameQA;
    } else if (_instance.flavor == Flavor.DEV) {
      return StringResources.appNameDev;
    } else {
      return StringResources.appName;
    }
  }
}
