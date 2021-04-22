

import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/dashboard/model/blog_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class BlogRepository{

  Future<Either<AppError,BlogList>> fetchBlog() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/news-blogs/list-by-type?blogType=2";
    try{
      var client = http.Client();
      var response = await client.get(url);
      if (response.statusCode == 200) {
        print(response.body);


        BlogModel data = blogModelFromJson(response.body) ;
       // print('Dataaaaaaa::::::: ' + data.items[1].title);
        // return data;

        return Right(
            BlogList(
              dataList: data.items,
            )

        );
      }else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    }on SocketException catch (e){
      //logger.e(e);
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    }catch (e) {
      //logger.e(e);
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }

  }
}

class BlogList{
  List<Item> dataList = new List<Item>();
  BlogList({this.dataList});
}