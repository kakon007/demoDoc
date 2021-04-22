import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:myhealthbd_app/features/dashboard/view_model/blog_view_model.dart';
import 'package:myhealthbd_app/features/news/view_model/news_view_model.dart';
import 'package:myhealthbd_app/features/videos/view_models/video_view_model.dart';
import 'package:myhealthbd_app/features/dashboard/view/widgets/blog_vlog_article_card.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/custom_card_video.dart';
import 'package:provider/provider.dart';

var list = [
  vlog(name: "Health Blog", image: "assets/images/blog.png", color: "#C6FEDE"),
  vlog(
      name: "Health Article",
      image: "assets/images/article.png",
      color: "#D0EFFF"),
  vlog(name: "Health Vlog", image: "assets/images/v.png", color: "#DEE3FC"),
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

  // void onPageChange(int index, CarouselPageChangedReason changeReason) {
  //   setState(() {
  //     itemIndex = index;
  //   });
  // }

  @override
  void initState() {
    itemIndex = widget.pageNo;
    var vm = Provider.of<VideoViewModel>(context, listen: false);
    vm.getData(isFromOnPageLoad: true);
    var vm2 = Provider.of<NewsViewModel>(context, listen: false);
    vm2.getData(isFromOnPageLoad: true);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void onPageChange(int index, CarouselPageChangedReason changeReason) {
      setState(() {
        itemIndex = index;
      });
    }

    // final List<Widget> imageSliders = list
    //     .map((item) => Column(
    //   children: [
    //     Container(
    //       margin: EdgeInsets.all(5.0),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //           BoxShadow(
    //             color: itemIndex==  1 ? Colors.black.withOpacity(0.1) :HexColor(item.color).withOpacity(0.1),
    //             offset: Offset(2.0, 2.0),
    //             blurRadius: 3.0,
    //             spreadRadius: 2.0,
    //           ),
    //         ],
    //       ),
    //
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //         child: Container(
    //             width: 1000,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(10),
    //               color: HexColor(item.color),
    //             ),
    //             padding: EdgeInsets.symmetric(
    //                 vertical: 10.0, horizontal: 20.0),
    //             child: Row(
    //               children: <Widget>[
    //                 SizedBox(
    //                   width: 15,
    //                 ),
    //                 Container(
    //                   width: 75,
    //                   child: Text(
    //                     item.name,
    //                     style: GoogleFonts.poppins(
    //                         fontSize: 20, fontWeight: FontWeight.w500),
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   width: 10,
    //                 ),
    //                 Flexible(
    //                   child: Container(
    //                     height: 130,
    //                     width: 125,
    //                     child: Image.asset(
    //                       item.image,
    //                       fit: BoxFit.fill,
    //                     ),
    //                   ),
    //                 )
    //               ],
    //             )),
    //       ),
    //     ),
    //     // Text("Shakil")
    //   ],
    // ))
    //     .toList();
    var searchField = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "Blog, Article & Vlog",
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        SignUpFormField(
          borderRadius: 30,
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
    var vm = Provider.of<VideoViewModel>(context, listen: false);
    var vm2 = Provider.of<NewsViewModel>(context, listen: false);
    var vm3 = Provider.of<BLogViewModel>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            searchField,
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
                            vertical: 10.0, horizontal: 20.0),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 75,
                              child: Text(
                                list[a].name,
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: HexColor("#354291")),
                              ),
                            ),
                            SizedBox(
                              width: 10,
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
                height: 125,
                initialPage: itemIndex,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: onPageChange,
                //autoPlay: true,
              ),
              carouselController: _controller,
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                itemIndex == 2
                    ? "Health Vlog"
                    : itemIndex == 1
                        ? "Health Article"
                        : "Health Blog",
                style: GoogleFonts.poppins(
                    fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: itemIndex == 1
                          ? vm2.newsList.length
                          : itemIndex == 2
                              ? vm.videoList.length
                              : vm3.newsList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemIndex == 2
                            ? BlogVlogArticleCard(
                                buttonName: "Watch Video",
                                pageNo: "2",
                                videoId: vm.videoList[index].snippet.resourceId
                                    .videoId,
                                description:
                                    vm.videoList[index].snippet.description,
                                title: vm.videoList[index].snippet.title,
                                image: vm.videoList[index].snippet.thumbnails
                                    .standard.url,
                              )
                            : itemIndex == 1
                                ? BlogVlogArticleCard(
                                    title: vm2.newsList[index].title,
                                    buttonName: "Read News",
                                    image: vm.videoList[index].snippet
                                        .thumbnails.standard.url,
                                    pageNo: "1",
                                    url: vm2.newsList[index].newsLink,
                                  )
                                : BlogVlogArticleCard(
                                    title: vm3.newsList[index].title,
                                    buttonName: "Read Blog",
                                    image: vm.videoList[index].snippet
                                        .thumbnails.standard.url,
                                    pageNo: "0",
                                    blogDetails: vm3.newsList[index].blogDetail,
                                  );
                      })),

              // return BlogVlogArticleCard(
              //   buttonName: "Read News",
              //   title: vm2.newsList[index].title==null? "" : vm2.newsList[index].title,
              //   image: vm2.newsList[index].image== null? "": vm2.newsList[index].image,
              //   url: vm2.newsList[index].newsLink== null? "": vm2.newsList[index].newsLink,
              //   pageNo: widget.pageNo.toString(),
              // );
            ),
          ],
        ),
      ),

      // Column(
      //   children: <Widget>[
      //     CarouselSlider.builder(
      //       itemCount: imageSliders.length,
      //       itemBuilder: (BuildContext context, int a, int i) {
      //         return imageSliders[a];
      //
      //       },
      //       options: CarouselOptions(
      //         initialPage: itemIndex,
      //         enlargeCenterPage: true,
      //         aspectRatio: 16/9,
      //         onPageChanged: onPageChange,
      //         //autoPlay: true,
      //       ),
      //       carouselController: _controller,
      //     ),
      //     Center(
      //       child: Expanded(
      //         child: Column(children: [
      //           itemIndex== 1 ? SingleChildScrollView(
      //         scrollDirection: Axis.vertical,
      //           child: Padding(
      //             padding: const EdgeInsets.only(left:18.0,),
      //             child:
      //             Column(
      //               children: [
      //                 ...List.generate(
      //                   vm.videoList.length,
      //                       (i) => CustomCardVideo(vm.videoList[i].snippet.thumbnails.standard.url,vm.videoList[i].snippet.title,vm.videoList[i].snippet.resourceId.videoId,vm.videoList[i].snippet.description),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ) : Text("Prity")
      //           //Text(),
      //         ],),
      //       ),
      //     )
      //   ],
      // )
    );
  }
}

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
//
// class HealthVideoAll extends StatefulWidget {
//   @override
//   _HealthVideoAllState createState() => _HealthVideoAllState();
// }
//
// class _HealthVideoAllState extends State<HealthVideoAll> {
//   var list = [
//     vlog(name: "Blog", image: "assets/images/vlog.png"),
//     vlog(name: "Vlog", image: "assets/images/vlog.png"),
//     vlog(name: "Article", image: "assets/images/article.png"),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     var searchField = Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 8.0),
//           child: Text(
//             "Blog, Article & Vlog",
//             style: GoogleFonts.poppins(fontSize: 20),
//           ),
//         ),
//         SignUpFormField(
//           borderRadius: 30,
//           hintText: "Search here",
//           suffixIcon: Padding(
//             padding: const EdgeInsets.only(right: 20.0),
//             child: Icon(
//               Icons.search_rounded,
//               color: Colors.grey,
//             ),
//           ),
//         )
//       ],
//     );
//     return Scaffold(
//       appBar: AppBar(
//         leading: BackButton(color: Colors.black),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//       ),
//       body: ListView(
//         children: <Widget>[
//           CarouselSlider(items: , )
//         ],
//       )
//     );
//   }
// }
//
class vlog {
  String name;
  String image;
  String color;

  vlog({this.name, this.image, this.color});
}
// // Container(
// //   height: 150,
// //   child: Expanded(
// //      child:  ListView.builder(
// //          scrollDirection: Axis.horizontal,
// //          itemCount: list.length,
// //          itemBuilder: (BuildContext context, int index) {
// //            return Container(
// //              margin: EdgeInsets.all(8),
// //              height: 120,
// //              width: MediaQuery.of(context).size.width*.7,
// //              color: Colors.grey,
// //              child: Row(children: [
// //                SizedBox(width: 30,),
// //                Text(list[index].name, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),),
// //                SizedBox(width: 20,),
// //                Container(height: 100, width: 130, child: Image.asset(list[index].image, fit: BoxFit.fill,),)
// //              ],),
// //            );
// //          }),
// //   ),
// // ),