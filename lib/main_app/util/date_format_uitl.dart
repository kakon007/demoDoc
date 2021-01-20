
import 'package:intl/intl.dart';
//import 'package:synchronized/extension.dart';
import 'package:flutter/material.dart';

class DateFormatUtil{



  static String dateFormatYYYMMDD(DateTime dateTime){
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
  static String formatDate(DateTime dateTime){
    if(dateTime == null){
      return null;
    }
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
  static String formatDateTime(DateTime dateTime){
    if(dateTime == null){
      return null;
    }
    return DateFormat("dd/MM/yyyy").add_jm().format(dateTime.toLocal());
  }
  String dateFormat1(DateTime dateTime){
    if(dateTime == null){
      return null;
    }
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

}


