import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';

class Contact extends StatelessWidget {
  static const routeName = "Contact";
  @override
  Widget build(BuildContext context) {
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final bool tablet = isTablet(MediaQuery.of(context));
    return Container(
      color: AppColors.AccentColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Let's Talk", style: TextStyle(
                fontSize: 25
              ),),
            ],
          ),
        ],
      ),
    );
  }
}
