import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceCard extends StatelessWidget {

  ExperienceCard();

  @override
  Widget build(BuildContext context) {
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final bool tablet = isTablet(MediaQuery.of(context));
    return Container(
      height: tablet ? hp(35) : hp(75),
      margin: EdgeInsets.only(bottom: hp(5)),
      decoration: BoxDecoration(
          color: AppColors.PrimaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.DarkPrimaryColor.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(-5, 5), // changes position of shadow
            ),
          ]),
    );
  }

  void launchUrl(String url) async{
    if (await canLaunch(url)) {
      await launch(url);
    }else {
      throw Exception("Could not launch URL");
    }
  }
}
