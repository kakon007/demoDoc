import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/book_test/model/company_list_model.dart';
import 'package:myhealthbd_app/main_app/api_client.dart';
import 'package:myhealthbd_app/main_app/failure/app_error.dart';

class CompanyListRepository{
  Future<CompanyListModel> fetchCompanyListData() async {
    try{
      var response=await ApiClient().getRequest('online-appointment-api/fapi/diagnostic-item-booking/get-company-List');
      print('constwer ${response.statusCode}');
      if(response.statusCode==200){
        // var body=response.body;
        print('constwer ${response.body}');
        CompanyListModel data=companyListModelFromJson(response.body);
        return data;
      }else{
        print(response.reasonPhrase);
        // return Left(
        //     AppError.httpError
        // );
      }
    }catch(e){
      print(e);
    }
  }
}

// class CompanyListMo{
//   CompanyListModel companyList;
//   CompanyListMo({this.companyList});
// }