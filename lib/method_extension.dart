import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myhealthbd_app/main_app/util/date_format_uitl.dart';
import 'package:myhealthbd_app/main_app/util/zefyr_helper.dart';



extension DateTimeExtension on DateTime {
  String get toYYYMMDDString {
    if (this != null)
      return DateFormatUtil.dateFormatYYYMMDD(this);
    else
      return null;
  }
  String get formatDateJX {
    if (this != null)
      return DateFormatUtil.formatDate(this);
    else
      return null;
  }
  String get formatDateTimeJX {
    if (this != null)
      return DateFormatUtil.formatDateTime(this);
    else
      return null;
  }

  bool  isToday() {
    if (this != null) {
      var day = DateTime.now().day;
      var month = DateTime.now().month;
      var year = DateTime.now().year;
      return this.day == day && this.month == month && this.year == year;
    } else {
      return false;
    }
  }
}

// extension NotusDocumentEx on NotusDocument {
//   String get toHTML {
//     return ZeyfrHelper.notusDocumentToHTML(this);
//   }
// }

extension StringExtension on String {
  // NotusDocument get htmlToNotusDocument {
  //   return ZeyfrHelper.htmlToNotusDocument(this);
  // }
  bool get isEmptyOrNull {
    if (this != null) {
      return this.isEmpty;
    } else
      return true;
  }

  bool get isNotEmptyOrNotNull {
    if (this != null) {
      return this.isNotEmpty;
    } else
      return false;
  }

  String get replaceAmpWith26 {
    if (this != null) {
      return this.replaceAll("%26", "&");
    } else
      return null;
  }

  String get toSentenceCase {
    if(this != null){
      String x = '';
      for(int i=1; i<this.length; i++){
        x += this[i].toLowerCase();
      }
      return this[0].toUpperCase()+x;
    }else
      return null;
  }

  String get swapValueByComa {
    if(this == null)
      return null;
    try {
      List<String> list = this.split(",");
      return "${list[1]}, ${list[0]}";
    } catch (e) {
      print(e);
      return this;
    }
  }

  String get getStringInNotNull {
    if (this.isNotEmptyOrNotNull) {
      return this;
    } else
      return null;
  }
}
extension ListExtension<T> on List<T>{

  T get firstOrNull {
    if(this.isEmpty)
      return null;
    return this.first;
  }

}
