import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class NameCard extends StatelessWidget {
  double width;
  double height;

  NameCard({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final bool tablet = isTablet(MediaQuery.of(context));
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.DarkPrimaryColor.withOpacity(0.2),
          blurRadius: 20,
          offset: Offset(-10, 10), // changes position of shadow
        ),
      ]),
      child: Column(
        children: [
          Flexible(
            flex: 90,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  color: AppColors.LightAccentColor),
              child: Column(
                children: [
                  Flexible(
                    flex: 50,
                    child: Row(
                      children: [
                        Flexible(flex: 20, child: Container()),
                        Flexible(
                          flex: 60,
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(hp(50)),
                              child: Image.asset("assets/images/profile.jpg"),
                            ),
                          ),
                        ),
                        Flexible(flex: 20, child: Container()),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 20,
                      child: Text(
                        "Michael Angelo\nCadavillo",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  Flexible(
                      flex: 30,
                      child: Container(
                        child: Column(children: [
                          SizedBox(height: height * 0.05),
                          Divider(
                            thickness: 2,
                            indent: width * 0.35,
                            endIndent: width * 0.35,
                            color: AppColors.DarkPrimaryColor,
                          ),
                          SizedBox(height: height * 0.05),
                          Text(
                            "FLUTTER DEVELOPER",
                            style: TextStyle(
                                letterSpacing: 5,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                      )),
                ],
              ),
            ),
          ),
          Flexible(
              flex: 10,
              child: Container(
                // padding: EdgeInsets.symmetric(vertical: hp(1)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.DarkPrimaryColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, -1), // changes position of shadow
                      ),
                    ],
                    color: AppColors.PrimaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    socialMediaIcon(imageUrl: "assets/images/facebook.png",
                        onTap: (){
                          launchUrl("https://www.facebook.com/MichaelCadavillo/");
                        },
                        tablet: tablet,
                        hp: hp,
                        wp: wp
                    ),
                    socialMediaIcon(imageUrl: "assets/images/linkedin.png",
                        onTap: (){
                          launchUrl("https://www.linkedin.com/in/michaelcadavillo/");
                        },
                        tablet: tablet,
                        hp: hp,
                        wp: wp
                    ),
                    socialMediaIcon(imageUrl: "assets/images/github.png",
                        onTap: (){
                          launchUrl("https://github.com/MichaelCadavillo");
                        },
                        tablet: tablet,
                        hp: hp,
                        wp: wp
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget socialMediaIcon({required String imageUrl, required Function() onTap, required bool tablet, required Function hp, required Function wp}){
    return Container(
      margin: EdgeInsets.symmetric(vertical: hp(1)),
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Ink(
            color: AppColors.PrimaryColor,
            child: Container(
                padding: EdgeInsets.symmetric(vertical: hp(1.15), horizontal: tablet ? hp(1) : wp(2)),
                child: Image.asset(imageUrl, fit: BoxFit.fitHeight)
            ),
          ),
        ),
      ),
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
