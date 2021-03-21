import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myhealthbd_app/main_app/resource/strings_resource.dart';
import 'package:myhealthbd_app/main_app/views/widgets/SignUpField.dart';
import 'package:myhealthbd_app/main_app/views/widgets/search_bar_viw_widget.dart';
class Sample2 extends StatefulWidget {
  @override
  _Sample2State createState() => _Sample2State();
}

class _Sample2State extends State<Sample2> {
  double changingHeight;
  double appBarHeight;
  bool appBarSearchShow = false;
  final TextEditingController _filter = new TextEditingController();

  List<String> itemList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              createSilverAppBar1(),
              createSilverAppBar2()
            ];
          },
          body: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(itemList[index]),
                  ),
                );
              })),
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: Colors.redAccent,
      expandedHeight: 300,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/mainBackImage.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
    );
  }

  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
      backgroundColor: Colors.redAccent,
      pinned: true,
      title: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(1.1, 1.1),
                blurRadius: 5.0),
          ],
        ),
        child: CupertinoTextField(
          controller: _filter,
          keyboardType: TextInputType.text,
          placeholder: 'Search',
          placeholderStyle: TextStyle(
            color: Color(0xffC4C6CC),
            fontSize: 14.0,
            fontFamily: 'Brutal',
          ),
          prefix: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
            child: Icon(
              Icons.search,
              size: 18,
              color: Colors.black,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({@required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image.network(
          "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 4,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Card(
              elevation: 10,
              child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width / 2,
                child: FlutterLogo(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}


//
// import 'package:flutter/material.dart';
//
// class MainCollapsingToolbar extends StatefulWidget {
//   @override
//   _MainCollapsingToolbarState createState() => _MainCollapsingToolbarState();
// }
//
// class _MainCollapsingToolbarState extends State<MainCollapsingToolbar> {
//   @override
//   Widget build(BuildContext context) {
//     var deviceWidth=MediaQuery.of(context).size.width;
//     var contrainerWidth=deviceWidth>=400?double.infinity:400.00;
//     return Scaffold(
//       body: DefaultTabController(
//         length: 1,
//         child: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//             return <Widget>[
//               SliverAppBar(
//                 expandedHeight: 200.0,
//                 floating: false,
//                 pinned: true,
//                 flexibleSpace: FlexibleSpaceBar(
//                     centerTitle: true,
//                     title: Text("Collapsing Toolbar",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.0,
//                         )),
//                     background: Image.network(
//                       "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
//                       fit: BoxFit.cover,
//                     )),
//               ),
//               SliverPersistentHeader(
//                 delegate: _SliverAppBarDelegate(
//                   TabBar(
//                     labelColor: Colors.black87,
//                     unselectedLabelColor: Colors.grey,
//                     tabs: [
//              Container(
//             width: contrainerWidth,
//             height: 50,
//             decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(25),
//             color: Colors.white,
//             boxShadow: [
//             BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//             offset: Offset(0, 2), // changes position of shadow
//             ),
//             ],
//             ),
//             child: InkWell(
//             onTap: (){},
//             child: Row(
//             children: <Widget>[
//             SizedBox(
//             width: 8,
//             ),
//             Text(
//             "  Type hospital / Diagnosis / Doctor Chamber",
//             style: TextStyle(
//             color: Colors.grey[400],
//             fontSize: deviceWidth>=400?15:12,
//             ),
//             ),
//             Spacer(),
//             Padding(
//             padding: const EdgeInsets.only(right:8.0),
//             child: Icon(
//             Icons.search,
//             color: Colors.grey,
//             size: 28,
//             ),
//             ),
//
//             ],
//             ),
//             ),
//             )
//                     ],
//                   ),
//                 ),
//                 pinned: true,
//               ),
//             ];
//           },
//           body: Center(
//             child: Text("Sample text"),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   _SliverAppBarDelegate(this._tabBar);
//
//   final TabBar _tabBar;
//
//   @override
//   double get minExtent => _tabBar.preferredSize.height;
//   @override
//   double get maxExtent => _tabBar.preferredSize.height;
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return new Container(
//       child: _tabBar,
//     );
//   }
//
//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }