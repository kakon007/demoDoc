import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/book_test/model/test_item_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class TestItemListRepository{
  Future<Either<AppError,TestItemMo>> fetchTestListDataData({int companyNo}) async {
    try{
      var response=await ApiClient().getRequest('online-appointment-api/fapi/diagnostic-item-booking/gridList?draw=1&columns%5B0%5D%5Bdata%5D=0&columns%5B0%5D%5Bname%5D=&columns%5B0%5D%5Bsearchable%5D=true&columns%5B0%5D%5Borderable%5D=true&columns%5B0%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B0%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B1%5D%5Bdata%5D=maxDisPct&columns%5B1%5D%5Bname%5D=&columns%5B1%5D%5Bsearchable%5D=true&columns%5B1%5D%5Borderable%5D=false&columns%5B1%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B1%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B2%5D%5Bdata%5D=itemName&columns%5B2%5D%5Bname%5D=itemName&columns%5B2%5D%5Bsearchable%5D=true&columns%5B2%5D%5Borderable%5D=true&columns%5B2%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B2%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B3%5D%5Bdata%5D=salesPrice&columns%5B3%5D%5Bname%5D=salesPrice&columns%5B3%5D%5Bsearchable%5D=true&columns%5B3%5D%5Borderable%5D=true&columns%5B3%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B3%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B4%5D%5Bdata%5D=buName&columns%5B4%5D%5Bname%5D=buName&columns%5B4%5D%5Bsearchable%5D=true&columns%5B4%5D%5Borderable%5D=true&columns%5B4%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B4%5D%5Bsearch%5D%5Bregex%5D=false&columns%5B5%5D%5Bdata%5D=5&columns%5B5%5D%5Bname%5D=&columns%5B5%5D%5Bsearchable%5D=true&columns%5B5%5D%5Borderable%5D=true&columns%5B5%5D%5Bsearch%5D%5Bvalue%5D=&columns%5B5%5D%5Bsearch%5D%5Bregex%5D=false&order%5B0%5D%5Bcolumn%5D=0&order%5B0%5D%5Bdir%5D=desc&start=0&length=9&search%5Bvalue%5D=&search%5Bregex%5D=false&ogNo=2&companyNo=$companyNo&_=1631090917974');
      print('constwer ${response.statusCode}');
      print('constwerdd $companyNo');
      if(response.statusCode==200){
       // var body=response.body;
        print('constwer ${response.body}');
        TestItemModel data=testItemModelFromJson(response.body);
        return Right(
            TestItemMo(dataList: data.items)
        );
      }else{
        print(response.reasonPhrase);
        return Left(
            AppError.httpError
        );
      }
    }catch(e){
      print(e);
    }
  }
}

class TestItemMo{
  List<Item> dataList=[];
  TestItemMo({this.dataList});
}