import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/auth/view_model/policy_view_model.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';

class Policy extends StatefulWidget {
  @override
  _PolicyState createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {


  @override
  void initState() {
    // TODO: implement initState
    var vm = Provider.of<PolicyViewModel>(context, listen: false);
    vm.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<PolicyViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Privacy Policy'
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child:vm.policy==null?Center(child: Loader()):Text(
                vm.policy
            ),
          ),
        ),
      ),
    );
  }
}
