

import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:myhealthbd_app/features/news/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';

class NewsRepository{
  // Future<NewsUpdatedModel> fetchNewspdate() async{
  //   var url='https://qa.myhealthbd.com:9096/online-appointment-api/fapi/news-blogs/list-by-type?blogType=1';
  //   var res=await http.get(url);
  //   if(res.statusCode==200){
  //     NewsUpdatedModel data2=newsUpdatedModelFromJson(res.body);
  //       data2.items.forEach((element) {
  //         dataList2.add(element);
  //       });
  //     print("bodddytew::::"+data2.items.first.title.toString());
  //     return data2;
  //   }else{
  //     return null;
  //   }
  // }


  Future<Either<AppError,NewsListM>> fetchNewspdate() async {
    var url =
        "https://qa.myhealthbd.com:9096/online-appointment-api/fapi/news-blogs/list-by-type?blogType=1";
    // List<Item> dataList = new List<Item>();

    try{
      var client = http.Client();
      var response = await client.get(url);
      if (response.statusCode == 200) {
        // Map<String, dynamic> jsonMap = json.decode(response.body);
        //data = jsonMap["items"];
        // HospitalListModel data =hospitalListModelFromJson(response.body) ;
        // var mapData = json.decode(utf8.decode(response.bodyBytes));
        // var hospitalList = fromJson(mapData);

        NewsUpdatedModel data = newsUpdatedModelFromJson(response.body) ;
        // data.items.forEach((elemant) {
        //   dataList.add(elemant);
        // });

        // data.items.forEach((elemant) {
        //   dataList.add(elemant);
        // });
        //
        print('Dataaaaaaa::::::: ' + data.items[1].title);
        // return data;

        return Right(
            NewsListM(
              dataList: data.items,
            )

        );
        //print(data[0]['companySlogan']);
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

class NewsListM{
  List<Item> dataList = new List<Item>();
  NewsListM({this.dataList});
}