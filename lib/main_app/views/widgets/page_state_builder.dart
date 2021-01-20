import 'package:flutter/material.dart';
//import 'package:p7app/main_app/failure/app_error.dart';
//import 'package:p7app/main_app/resource/strings_resource.dart';

import 'custom_loader.dart';
import 'failure_widget.dart';

class PageStateBuilder extends StatelessWidget {
  //final AppError appError;
  final Widget child;
  final bool showLoader;
  final bool showError;
  final Future Function() onRefresh;

  PageStateBuilder({
    this.showError = false,
    //@required this.appError,
    @required this.child,
    @required this.onRefresh,
    this.showLoader = false,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: onRefresh,
        child: showLoader
            ? Center(
                child: CustomLoader(),
              )
            : Container(
                child: showError
                    ? ListView(
                        physics: AlwaysScrollableScrollPhysics(),
                        //children: [_errorWidget(context)],
                      )
                    : child,
              ));
  }

  // Widget _errorWidget(BuildContext context) {
  //   switch (appError) {
  //     case AppError.serverError:
  //       return FailureFullScreenWidget(
  //         errorMessage: StringResources.unableToLoadData,
  //         onTap: onRefresh,
  //       );
  //
  //     case AppError.networkError:
  //       return FailureFullScreenWidget(
  //         errorMessage: StringResources.couldNotReachServer,
  //         onTap: onRefresh,
  //       );
  //
  //     default:
  //       return FailureFullScreenWidget(
  //         errorMessage: StringResources.somethingIsWrong,
  //         onTap: onRefresh,
  //       );
  //   }
  // }
}
