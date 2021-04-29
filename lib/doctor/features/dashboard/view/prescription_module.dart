import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Module extends StatefulWidget {
  @override
  _ModuleState createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Prescription Module"),),);
  }
}
