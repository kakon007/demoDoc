import 'package:notustohtml/notustohtml.dart';
//import 'package:p7app/professional/main_app/views/widgets/custom_zefyr_rich_text_from_field.dart';
import 'package:quill_delta/quill_delta.dart';
//import 'package:p7app/method_extension.dart';
import 'package:myhealthbd_app/method_extension.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_zefyr_rich_text_from_field.dart';
import 'package:zefyr/zefyr.dart';

class ZeyfrHelper {
  static NotusDocument htmlToNotusDocument(String htmlString) {
    if (htmlString.isEmptyOrNull) {
      return NotusDocument();
    }
    final converter = NotusHtmlCodec();
    Delta delta = converter.decode("$htmlString\n"); // Zefyr compatible Delta
    NotusDocument document = NotusDocument.fromDelta(delta);
    return document;
  }

  static String notusDocumentToHTML(NotusDocument notusDocument) {
    final converter = NotusHtmlCodec();
    String html = converter.encode(notusDocument.toDelta());
    return html;
  }
}
