import 'package:flutter/material.dart';

import 'flavour_config.dart';

class FlavorBanner extends StatefulWidget {
  final Widget child;
  final BannerConfig bannerConfig;

  FlavorBanner({@required this.child, this.bannerConfig});

  @override
  _FlavorBannerState createState() => _FlavorBannerState(this.bannerConfig);
}

class _FlavorBannerState extends State<FlavorBanner> {
  BannerConfig bannerConfig;

  _FlavorBannerState(this.bannerConfig);

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.isProduction()) return widget.child;
    bannerConfig ??= _getDefaultBanner();

    return Stack(
      children: <Widget>[widget.child, _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
        bannerName: FlavorConfig.instance.name,
        bannerColor: FlavorConfig.instance.color);
  }

  Widget _buildBanner(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: bannerConfig.bannerName,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig.bannerColor),
      ),
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;

  BannerConfig(
      {@required String this.bannerName, @required Color this.bannerColor});
}

