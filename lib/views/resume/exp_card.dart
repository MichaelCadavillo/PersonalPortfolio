import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';

class ExperienceCard extends StatelessWidget {
  final String companyName;
  final String companyLocation;
  final String description;
  final String dateFrom;
  final String dateTo;
  final String position;

  ExperienceCard({
    required this.companyName,
    required this.companyLocation,
    required this.description,
    required this.dateFrom,
    required this.dateTo,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final bool tablet = isTablet(MediaQuery.of(context));
    return Container(
      height: tablet ? hp(40) : hp(75),
      margin: EdgeInsets.only(bottom: hp(5)),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 75),
      decoration: BoxDecoration(
          color: AppColors.PrimaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.DarkPrimaryColor.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(-5, 5), // changes position of shadow
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            flex: 45,
            child: Container(
              padding: EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$dateFrom - $dateTo",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.DarkPrimaryColor
                      ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$position",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$companyName",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        letterSpacing: 3,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$companyLocation",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 55,
            child: Column(
              children: [
                Text("$description",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
