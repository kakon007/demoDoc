import 'package:flutter/material.dart';
import 'package:myhealthbd_app/doctor/features/dashboard/view/widgets/worklists_widget.dart';

class AllWorkLists extends StatefulWidget {
  const AllWorkLists({Key key}) : super(key: key);

  @override
  _AllWorkListsState createState() => _AllWorkListsState();
}

class _AllWorkListsState extends State<AllWorkLists> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Today\'s worklist"),),
      body: ListView.builder(
          shrinkWrap: true,
         // physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: TodayWorkList(),
            );
          })
    );
  }
}
