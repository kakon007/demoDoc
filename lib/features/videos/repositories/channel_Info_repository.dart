
import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:myhealthbd_app/features/videos/models/channel_info_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/util/constants.dart';
import 'package:http/http.dart' as http;

class VideoInfoRepository{
  static const Channel_Id="UCRNBfqATYKXvy6c7gxndDUA";
  static const _baseURL="youtube.googleapis.com";

  //https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet%2CcontentDetails&playlistId=UURNBfqATYKXvy6c7gxndDUA&key=AIzaSyAIUjojgzDL8qTGaAMEEZPIzGRmbSgRP2w
//
//  Future<ChannelInfoModel> getVideoInfo()async{
//   Map<String,String> params={
//     'part' : 'snippet,contentDetails',
//     'playlistId' : 'UURNBfqATYKXvy6c7gxndDUA',
//     'key' : Constants.API_key,
//   };
//   Uri uri=Uri.https(_baseURL, '/youtube/v3/playlistItems',params);
//
//   var client = http.Client();
//   var response = await client.get(uri);
//   print("Channel Info::"+response.body);
//   ChannelInfoModel channelInfoModel=channelInfoModelFromJson(response.body);
//   return channelInfoModel;
// }

  Future<Either<AppError,VideoListM>> getVideoInfo() async {
    Map<String,String> params={
      'part' : 'snippet,contentDetails',
      'playlistId' : 'UURNBfqATYKXvy6c7gxndDUA',
      'key' : Constants.API_key,
    };
    Uri uri=Uri.https(_baseURL, '/youtube/v3/playlistItems',params);

    try{
      var client = http.Client();
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        ChannelInfoModel data = channelInfoModelFromJson(response.body) ;
        print('Dataaaaaaa::::::: ' + data.items[1].snippet.title);
        // return data;

        return Right(
            VideoListM(
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

class VideoListM{
  List<Item> dataList = new List<Item>();
  VideoListM({this.dataList});
}