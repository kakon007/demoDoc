import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/news/model/news_logo_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class NewsLogoRepository {
  Future<Either<AppError, NewsLogoM>> fetchNewsLogo() async {
    var url =
        "${Urls.baseUrl}online-appointment-api/fapi/news-blogs/logo-list?blogType=1";

    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        NewsLogoModel data = newsLogoModelFromJson(response.body);
        return Right(NewsLogoM(
          dataList: data.items,
        ));
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      return Left(AppError.networkError);
    } catch (e) {
      return Left(AppError.unknownError);
    }
  }
}

class NewsLogoM {
  List<Item> dataList = new List<Item>();

  NewsLogoM({this.dataList});
}
