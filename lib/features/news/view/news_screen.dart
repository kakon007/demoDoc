import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:myhealthbd_app/features/news/model/news_model.dart';
import 'package:myhealthbd_app/features/news/view_model/news_view_model.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_view_for_news.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController;
    var vm = Provider.of<NewsViewModel>(context);
    List<Item> list = vm.newsList;
    var lengthh = list.length;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: RefreshIndicator(
          onRefresh: vm.refresh,
          child: vm.shouldShowPageLoader
              ? Center(
            child: Loader(),
          )
              : ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              controller: _scrollController,
              itemCount: lengthh,
              separatorBuilder: (context, index) => SizedBox(
                height: 8,
              ),
              itemBuilder: (BuildContext context, int index) {
                // if (index == lengthh) {
                //   return vm.isFetchingMoreData
                //       ? Padding(padding: EdgeInsets.all(15), child: Loader())
                //       : SizedBox();
                // }
                //List<Item> advice = list[index];
                print("LIIIISSSYYSY:::" + list[index].title);
                return CustomCardNews(DateUtil().formattedDate(DateTime.parse(list[index].publishDate).toLocal()),list[index].title,list[index].newsLink);
              }),
        ),
      ),
    );
  }
}


class DateUtil {
  static const DATE_FORMAT = 'yyyy-MM-dd';
  String formattedDate(DateTime dateTime) {
    print('dateTime ($dateTime)');
    return DateFormat(DATE_FORMAT).format(dateTime);
  }
}