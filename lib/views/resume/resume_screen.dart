import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';
import 'package:personal_portfolio/views/resume/exp_card.dart';

class Resume extends StatelessWidget {
  static const routeName = "Resume";
  @override
  Widget build(BuildContext context) {
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final bool tablet = isTablet(MediaQuery.of(context));
    return SingleChildScrollView(
      child: Container(
        color: AppColors.AccentColor,
        child: Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: tablet ? wp(45) : wp(90),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Title
                    Container(
                      margin: EdgeInsets.symmetric(vertical: hp(10)),
                      child: Text("Resume", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                        fontSize: 25
                      ),),
                    ),
                  ],
                ),
                // Header
                Container(
                  margin: EdgeInsets.symmetric(vertical: hp(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Experience", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                          fontSize: 22
                      ),
                      ),
                  ElevatedButton(
                    onPressed: () {
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
                    child: const Text("Download CV",
                        style: TextStyle(fontSize: 18)),
                  ),
                    ],
                  ),

                ),
                ExperienceCard(),
                ExperienceCard(),
                ExperienceCard(),
                ExperienceCard(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
