import 'package:flutter/material.dart';
import 'package:portfolio/enums/screen_type.dart';
import 'package:portfolio/responsive/responsive_builder.dart';
import 'package:portfolio/responsive/sizing_information.dart';
import 'package:portfolio/views/portfolio_home/portfolio_home_desktop.dart';

class PortfolioHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        switch (sizingInformation.screenType) {
          case ScreenType.desktop:
            return PortfolioHomeDesktop();
          case ScreenType.tablet:
            return PortfolioHomeDesktop();
          case ScreenType.mobile:
            return Container();
          default:
            return Container();
        }
      },
    );
  }
}
