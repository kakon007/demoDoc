import 'package:myhealthbd_app/main_app/flavour/flavour_config.dart';

class Urls {
  static String get baseUrl=>FlavorConfig.isProduction()?"https://myhealthbd.com/":"https://qa.myhealthbd.com:9096/";
  static get prescriptionViewUrl=>'${Urls.baseUrl}prescription-service-api/api/report/prescription';

}
