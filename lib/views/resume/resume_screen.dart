import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';
import 'package:personal_portfolio/views/resume/exp_card.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      launchUrl("https://www.google.com");
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
                ExperienceCard(
                  companyName: "Accenture Inc.",
                  companyLocation: "Quezon City, Philippines",
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis est non nunc consequat vulputate. Aenean posuere, metus eget semper fermentum, sem justo efficitur magna, non tincidunt est elit tempor sapien. Donec mattis vel lorem id lobortis. Nunc sed placerat orci. Suspendisse tempus quam quis condimentum rutrum.",
                  dateFrom: "Aug. 2019",
                  dateTo: "Feb. 2021",
                  position: "Associate Software Engineer",
                ),
                ExperienceCard(
                  companyName: "Company",
                  companyLocation: "Quezon City, Philippines",
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis est non nunc consequat vulputate. Aenean posuere, metus eget semper fermentum, sem justo efficitur magna, non tincidunt est elit tempor sapien. Donec mattis vel lorem id lobortis. Nunc sed placerat orci. Suspendisse tempus quam quis condimentum rutrum.",
                  dateFrom: "Aug. 2019",
                  dateTo: "Feb. 2021",
                  position: "Associate Software Engineer",
                ),
                ExperienceCard(
                  companyName: "Company",
                  companyLocation: "Quezon City, Philippines",
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis est non nunc consequat vulputate. Aenean posuere, metus eget semper fermentum, sem justo efficitur magna, non tincidunt est elit tempor sapien. Donec mattis vel lorem id lobortis. Nunc sed placerat orci. Suspendisse tempus quam quis condimentum rutrum.",
                  dateFrom: "Aug. 2019",
                  dateTo: "Feb. 2021",
                  position: "Associate Software Engineer",
                ),
                ExperienceCard(
                  companyName: "Company",
                  companyLocation: "Quezon City, Philippines",
                  description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin quis est non nunc consequat vulputate. Aenean posuere, metus eget semper fermentum, sem justo efficitur magna, non tincidunt est elit tempor sapien. Donec mattis vel lorem id lobortis. Nunc sed placerat orci. Suspendisse tempus quam quis condimentum rutrum.",
                  dateFrom: "Aug. 2019",
                  dateTo: "Feb. 2021",
                  position: "Associate Software Engineer",
                ),

              ],
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
