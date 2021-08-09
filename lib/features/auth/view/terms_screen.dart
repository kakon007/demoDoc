import 'package:flutter/material.dart';
import 'package:myhealthbd_app/features/auth/view_model/term_view_model.dart';
import 'package:myhealthbd_app/main_app/views/widgets/loader.dart';
import 'package:provider/provider.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  @override
  void initState() {
    // TODO: implement initState
    var vm = Provider.of<TermsViewModel>(context, listen: false);
    vm.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<TermsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Service'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: vm.terms == null ? Center(child: Loader()) : Text(vm.terms),
          ),
        ),
      ),
    );
  }
}
