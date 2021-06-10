import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/dashboard/model/blog_logo_model.dart';
import 'package:myhealthbd_app/features/dashboard/model/blog_model.dart' as blog;
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class BlogRepository {
  Future<Either<AppError, BlogList>> fetchBlog() async {
    var url = "${Urls.buildUrl}online-appointment-api/fapi/news-blogs/list-by-type?blogType=2";
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response.body);

        blog.BlogModel data = blog.blogModelFromJson(response.body);
        // print('Dataaaaaaa::::::: ' + data.items[1].title);
        // return data;

        return Right(BlogList(
          dataList: data.items,
        ));
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }

  Future<Either<AppError, BlogLogoList>> fetchBlogLogo() async {
    var url =
        "${Urls.buildUrl}online-appointment-api/fapi/news-blogs/logo-list?blogType=2";
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print(response.body);
        BlogLogoModel data = blogLogoModelFromJson(response.body);
        return Right(BlogLogoList(
          dataList2: data.items,
        ));
      } else {
        //BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      //logger.e(e);
      //BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}

class BlogList {
  List<blog.Item> dataList = new List<blog.Item>();
  BlogList({this.dataList});
}

class BlogLogoList {
  List<Item> dataList2 = new List<Item>();
  BlogLogoList({this.dataList2});
}
