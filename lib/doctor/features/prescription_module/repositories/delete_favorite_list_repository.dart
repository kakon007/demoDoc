import 'package:myhealthbd_app/main_app/api_client.dart';

class DeleteFavoriteLitRepository{
  Future deleteFavoriteList({var id})async{
    try {
      // var headers = {
      //   'Authorization': 'Bearer 01614e20-2691-4831-b552-8ced2a836ca3'
      // };
      // var request = http.Request('DELETE', Uri.parse('https://qa.myhealthbd.com:9096/prescription-service-api/api/favourites/delete?id=$id'));
      //
      // request.headers.addAll(headers);
      //
      // http.StreamedResponse response = await request.send();

      var response = await ApiClient().deleteRequest(
          "prescription-service-api/api/favourites/delete?id=$id");

      if (response.statusCode == 200) {
        var body=response.body;
        return body;
       // print(await response.stream.bytesToString());
      }
      else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
}
}