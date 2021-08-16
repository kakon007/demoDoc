import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:myhealthbd_app/features/cache/cache_repositories.dart';
import 'package:myhealthbd_app/features/user_profile/models/relationship_model.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/resource/urls.dart';

class RelationshipRepository {
  Future<Either<AppError, RelationshipModel>> fetchRelationship(
      String accessToken) async {
    var url = "${Urls.baseUrl}diagnostic-api/api/relations/list";
    try {
      var client = http.Client();
      var response = await client.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $accessToken',
      });
      if (response.statusCode == 200) {
        RelationshipModel data = relationshipModelFromJson(response.body);
        CacheRepositories.setCacheAsDecodeJson(
            response.body, CacheKeys.familyMemberRelationList);
       // print("shakil" + response.body);
        return Right(RelationshipModel(items: data.items));
      } else {
        BotToast.showText(text: StringResources.somethingIsWrong);
        return Left(AppError.serverError);
      }
    } on SocketException catch (e) {
      BotToast.showText(text: StringResources.unableToReachServerMessage);
      return Left(AppError.networkError);
    } catch (e) {
      BotToast.showText(text: StringResources.somethingIsWrong);
      return Left(AppError.unknownError);
    }
  }
}
