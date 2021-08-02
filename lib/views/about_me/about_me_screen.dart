import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';
import 'package:personal_portfolio/views/portfolio/portfolio_screen.dart';
import 'package:personal_portfolio/views/resume/resume_screen.dart';
import 'name_card.dart';

class AboutMe extends StatelessWidget {
  static const routeName = "About";
  @override
  Widget build(BuildContext context) {
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final bool tablet = isTablet(MediaQuery.of(context));
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: hp(100),
            child: Flex(
              direction: tablet ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                    flex: tablet ? 40 : 30,
                    child: Container(
                      color: tablet ? AppColors.AccentColor : AppColors.PrimaryColor,
                    )),
                Expanded(
                    flex: tablet ? 60 : 70,
                    child: Container(
                      color: tablet ? AppColors.PrimaryColor : AppColors.AccentColor,
                    ))
              ],
            ),
          ),
          Positioned(
              left: tablet ? wp(20) : null,
              top: tablet ? hp(10) : wp(10),
              child: Flex(
                  direction: tablet ? Axis.horizontal : Axis.vertical,
                  children: [
                    NameCard(
                        width: tablet ? wp(26) : wp(85),
                        height: hp(70)),
                    SizedBox(width: wp(2), height: hp(2)),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: tablet ? wp(26) : wp(85),
                      ),
                      child: Container(
                          height: tablet ? hp(70) : null,
                          child: Column(
                            mainAxisAlignment: tablet
                                ? MainAxisAlignment.spaceEvenly
                                : MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
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
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(Resume.routeName);
                                    },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 35,
                                            vertical: 15)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                30.0))),
                                  ),
                                  child: const Text("Resume",
                                      style: TextStyle(fontSize: 18)),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(Portfolio.routeName);
                                  },
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.symmetric(
                                            horizontal: 35,
                                            vertical: 15)),
                                    side: MaterialStateProperty
                                        .all<BorderSide>(BorderSide(
                                        color: AppColors
                                            .DarkPrimaryColor)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                30.0))),
                                  ),
                                  child: const Text(
                                    "Portfolio",
                                    style: TextStyle(
                                        color:
                                        AppColors.DarkPrimaryColor,
                                        fontSize: 18),
                                  ),
                                ),
                              ]),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis est non nunc consequat vulputate. Aenean posuere, metus eget semper fermentum, sem justo efficitur magna, non tincidunt est elit tempor sapien. Donec mattis vel lorem id lobortis. Nunc sed placerat orci. Suspendisse tempus quam quis condimentum rutrum.",
                                style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 3,
                                    wordSpacing: 4
                                ),
                              ),
                            ],
                          )),
                    )
                  ])),
        ],
      ),
    );
  }
}
