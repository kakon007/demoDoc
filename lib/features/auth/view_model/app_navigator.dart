
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final appNavigator=_AppNavigator();
class _AppNavigator{
  final navigatorKey=GlobalKey<NavigatorState>();
  BuildContext get context=>navigatorKey.currentContext;
  T getProvider<T>()=>Provider.of<T>(context, listen: false);
  T getProviderListener<T>()=>Provider.of<T>(context);
}

