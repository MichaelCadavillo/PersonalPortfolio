import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';
import 'package:personal_portfolio/views/landing_screen/card_name.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = "Home";

  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final bool tablet = isTablet(MediaQuery.of(context));

    return Scaffold(
      body: Container(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: AppColors.PrimaryColor,
            pinned: true,
            snap: true,
            floating: true,
            collapsedHeight: 100,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsetsDirectional.only(start: 50),
              centerTitle: false,
              title: Container(
                height: 100,
                child: Flex(
                  direction: tablet ? Axis.horizontal : Axis.vertical,
                  crossAxisAlignment: tablet
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  mainAxisAlignment: tablet
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Text(
                      'Michael Angelo Cadavillo',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87),
                    ),
                    tablet
                        ? Text(
                            ' / ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w100,
                                letterSpacing: 2,
                                color: Colors.black45),
                          )
                        : Container(),
                    Text(
                      'FLUTTER DEVELOPER',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 2,
                          color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: hp(100),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 40,
                              child: Container(
                                color: AppColors.AccentColor,
                              )),
                          Expanded(
                              flex: 60,
                              child: Container(
                                color: AppColors.PrimaryColor,
                              ))
                        ],
                      ),
                    ),
                    Positioned(
                        left: wp(20),
                        top: hp(10),
                        child: NameCard(width: wp(26), height: hp(70))),
                    Positioned(
                        left: wp(48),
                        top: hp(10),
                        child: Container(
                            height: hp(70),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello",
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "I'm a Flutter developer from the Philippines.",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Row(children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: 35, vertical: 15)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0))),
                                    ),
                                    child: const Text("Résumé",
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  OutlinedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: 35, vertical: 15)),
                                      side:
                                          MaterialStateProperty.all<BorderSide>(
                                              BorderSide(
                                                  color: AppColors
                                                      .DarkPrimaryColor)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0))),
                                    ),
                                    child: const Text(
                                      "Portfolio",
                                      style: TextStyle(
                                          color: AppColors.DarkPrimaryColor,
                                          fontSize: 18),
                                    ),
                                  ),
                                ]),
                              ],
                            ))),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
        ],
      )),
    );
  }
}
