
import 'dart:convert';
import 'dart:typed_data';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/blog_logo_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/blog_view_model.dart';
import 'package:myhealthbd_app/features/hospitals/view_model/hospital_logo_view_model.dart';
import 'package:myhealthbd_app/features/news/view_model/news_logo_view_model.dart';
import 'package:myhealthbd_app/features/news/view_model/news_view_model.dart';
import 'package:myhealthbd_app/features/videos/view_models/video_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/blog_vlog_article_card.dart';
import 'package:myhealthbd_app/main_app/util/responsiveness.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_video.dart';
import 'package:provider/provider.dart';

var list = [
  BlogVideoNews(name: "MyHealthBD Blog", image: "assets/images/blog.png", color: "#C6FEDE"),
  BlogVideoNews(
      name: "MyHealthBD News",
      image: "assets/images/article.png",
      color: "#D0EFFF"),
  BlogVideoNews(name: "MyHealthBD Video", image: "assets/images/v.png", color: "#DEE3FC"),
];

class HealthVideoAll extends StatefulWidget {
  int pageNo;

  HealthVideoAll({this.pageNo});

  @override
  State<StatefulWidget> createState() {
    return _HealthVideoAllState();
  }
}

class _HealthVideoAllState extends State<HealthVideoAll> {
  final CarouselController _controller = CarouselController();
  PageController _pageController;
  int itemIndex;

  ScrollController _scrollController = ScrollController();
  ScrollController _scrollController2 = ScrollController();
  ScrollController _scrollController3 = ScrollController();

  loadLogo(String image){
    Uint8List  _bytesImage = Base64Decoder().convert(image);
    return _bytesImage;
  }

  @override
  void initState() {
    itemIndex = widget.pageNo;
    var vm = Provider.of<VideoViewModel>(context, listen: false);
    if(vm.page==0){
      vm.getMoreData();
    }
    var vm2 = Provider.of<NewsViewModel>(context, listen: false);
    vm2.getData();
    var vm7 = Provider.of<NewsLogoViewModel>(context, listen: false);
    vm7.getData();
    var vm8 = Provider.of<BLogLogoViewModel>(context, listen: false);
    vm8.getData();
    super.initState();
    // TODO: implement initState

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        if(vm.videoListViewAll.length<vm.totalData){
          vm.getMoreData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    bool isTablet = Responsive.isTablet(context);
    bool isMobile = Responsive.isMobile(context);
    void onPageChange(int index, CarouselPageChangedReason changeReason) {
      setState(() {
        itemIndex = index;
      });
    }
    var searchField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            itemIndex==2? 'Video' : itemIndex==1 ? 'News' :  "Blog",
            style:
            GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        SignUpFormField(
          borderRadius: 30,
          hintSize: isTablet? 18: 15,
          hintText: "Search here",
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
    var vm = Provider.of<VideoViewModel>(context, listen: true);
    var vm2 = Provider.of<NewsViewModel>(context, listen: false);
    var vm3 = Provider.of<BLogViewModel>(context, listen: true);
    var vm7 = Provider.of<NewsLogoViewModel>(context);
    var vm8 = Provider.of<BLogLogoViewModel>(context);

    return Scaffold(
      appBar: AppBar(
         title: Text(itemIndex==2? 'Video' : itemIndex==1 ? 'News' :  "Blog",
           key: Key('blogVlogNewsAppbarKey'),
           style:
           GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //searchField,
            CarouselSlider.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int a, int i) {
                return Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: itemIndex == a
                            ? Colors.black.withOpacity(0.1)
                            : HexColor(list[a].color).withOpacity(0.1),
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Container(
                        width: 1000,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: HexColor(list[a].color),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: isTablet? 0 : 5,
                            ),
                            Container(
                              width: isTablet? 240 : 115,
                              child: Text(
                                list[a].name,
                                style: GoogleFonts.poppins(
                                    fontSize: isTablet? 22 : 18,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor("#354291")),
                              ),
                            ),
                            SizedBox(
                              width: isTablet?0 : 10,
                            ),
                            Flexible(
                              child: Container(
                                height: 105,
                                width: 120,
                                child: Image.asset(
                                  list[a].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        )),
                  ),
                );
              },
              options: CarouselOptions(
                height: isTablet? 160 : 125,
                initialPage: itemIndex,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                disableCenter: false,
                onPageChanged: onPageChange,
                //autoPlay: true,
              ),
              carouselController: _controller,
            ),
            SizedBox(
              height: 8,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  itemIndex == 2
                      ? "Health Videos"
                      : itemIndex == 1
                      ? "Health News"
                      : "Health Blog",
                  style: GoogleFonts.poppins(
                      fontSize: isTablet? 15 : 12, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  controller:itemIndex == 2? _scrollController:itemIndex == 1?_scrollController2:_scrollController3,
                  shrinkWrap: true,
                  itemCount: itemIndex == 1
                      ? vm2.newsList.length
                      : itemIndex == 2
                      ? vm.videoListViewAll.length
                      : vm3.newsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(index==vm.videoListViewAll.length){
                      return vm.isFetchingMoreData?SizedBox(height:60 ,child: Center(child: CircularProgressIndicator())):SizedBox();
                      //return SizedBox(height: 15,);

                    }
                    int i;
                    int i2;
                    if(itemIndex == 1 || itemIndex == 0){
                      if(itemIndex==1){
                        i = vm7.newsLogoList.indexWhere((element) => element.blogNo==vm2.newsList[index].blogNo);
                      }else{
                        i2 = vm8.blogLogoList.indexWhere((element) => element.blogNo==vm3.newsList[index].blogNo);
                      }

                    }
                    //int i = vm7.newsLogoList.indexWhere((element) => element.blogNo==vm2.newsList[index].blogNo);
                    // int i2 = vm8.blogLogoList.indexWhere((element) => element.blogNo==vm3.newsList[index].blogNo);
                    return itemIndex == 2
                        ? BlogVlogArticleCard(
                      buttonName: "Watch Video",
                      pageNo: "2",
                      videoId: vm.videoListViewAll[index].snippet.resourceId
                          .videoId,
                      description:
                      vm.videoListViewAll[index].snippet.description,
                      title: vm.videoListViewAll[index].snippet.title,
                      logo: vm.videoListViewAll[index].snippet
                          .thumbnails==null?'https://www.techandteen.com/wp-content/uploads/2020/11/MyHealthBD-Logo-High-Res..png':vm.videoListViewAll[index].snippet
                          .thumbnails.thumbnailsDefault.url,
                    )
                        : itemIndex == 1
                        ? BlogVlogArticleCard(
                      title: vm2.newsList[index].title,
                      buttonName: "Read News",
                      image: loadLogo(vm7.newsLogoList[i].logo),
                      pageNo: "1",
                      url: vm2.newsList[index].newsLink,
                    )
                        : BlogVlogArticleCard(
                      title: vm3.newsList[index].title,
                      buttonName: "Read Blog",
                      image: loadLogo(vm8.blogLogoList[i2].logo),
                      pageNo: "0",
                      blogDetails: vm3.newsList[index].blogDetail,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogVideoNews {
  String name;
  String image;
  String color;

  BlogVideoNews({this.name, this.image, this.color});
}
