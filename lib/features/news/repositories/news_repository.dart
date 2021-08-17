import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/news/model/news_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class NewsRepository {
  Future<Either<AppError, NewsListM>> fetchNewspdate() async {
    var url =
        "${Urls.baseUrl}online-appointment-api/fapi/news-blogs/list-by-type?blogType=1";

    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        NewsUpdatedModel data = newsUpdatedModelFromJson(response.body);

        return Right(NewsListM(
          dataList: data.items,
        ));
      } else {
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      return Left(AppError.unknownError);
    }
  }
}

class NewsListM {
  List<Item> dataList = new List<Item>();

  NewsListM({this.dataList});
}
