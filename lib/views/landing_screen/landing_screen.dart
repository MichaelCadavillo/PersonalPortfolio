import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/utility/colors.dart';
import 'package:personal_portfolio/utility/device_type.dart';
import 'package:personal_portfolio/utility/screen_utils.dart';
import 'package:personal_portfolio/views/contact/contact_screen.dart';
import 'package:personal_portfolio/views/portfolio/portfolio_screen.dart';
import 'package:personal_portfolio/views/resume/resume_screen.dart';
import '../about_me/about_me_screen.dart';
import '../about_me/name_card.dart';

class LandingScreen extends StatefulWidget {
  static const routeName = "Home";

  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _currentIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  Widget navButton({required String title, required Function onPressed}){
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        primary: Colors.black45,
        textStyle: const TextStyle(fontSize: 12,
          fontWeight: FontWeight.w100,
          letterSpacing: 2,),
      ),
      onPressed: () => onPressed(),
      child: Text(title),
    );
  }

  void screenNavigator(int index){
    switch(index){
      case 0: // About Me
        _navigatorKey.currentState?.pushReplacementNamed(AboutMe.routeName);
        break;
      case 1: // Resume
        _navigatorKey.currentState?.pushReplacementNamed(Resume.routeName);
        break;
      case 2: // Portfolio
        _navigatorKey.currentState?.pushReplacementNamed(Portfolio.routeName);
        break;
      case 3: // Contact
        _navigatorKey.currentState?.pushReplacementNamed(Contact.routeName);
        break;

    }
    return ;
  }

  List<Widget> getNavButtonList(bool tablet){
    return tablet
        ? [
            navButton(title: "About Me", onPressed: () => screenNavigator(0)),
            navButton(title: "Resume", onPressed: () => screenNavigator(1)),
            navButton(title: "Portfolio", onPressed: () => screenNavigator(2)),
            navButton(title: "Contact", onPressed: () => screenNavigator(3)),
          ]
        : [
          ListTile(title: Text("About Me")),
          ListTile(title: Text("Resume")),
          ListTile(title: Text("Portfolio")),
          ListTile(title: Text("Contact")),
        ];
  }

  @override
  Widget build(BuildContext context) {
    final Function hp = ScreenUtils(MediaQuery.of(context).size).hp;
    final Function wp = ScreenUtils(MediaQuery.of(context).size).wp;
    final bool tablet = isTablet(MediaQuery.of(context));

    return BackdropScaffold(
        stickyFrontLayer: true,
      backLayerBackgroundColor: AppColors.PrimaryColor,
      appBar: BackdropAppBar(
        backgroundColor: AppColors.PrimaryColor,
        leading: Container(),
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
        actions: <Widget>[
          tablet ?
              Row(
                children: getNavButtonList(tablet),
              )
              : BackdropToggleButton(
            color: AppColors.DarkPrimaryColor,
            icon: AnimatedIcons.close_menu,
          ),
        ],
      ),
      backLayer: BackdropNavigationBackLayer(
        items: getNavButtonList(tablet),
        onTap: (int position) => screenNavigator(position),
      ),
      frontLayerBorderRadius: BorderRadius.circular(0),
      frontLayer: Navigator(
        key: _navigatorKey,
        initialRoute: AboutMe.routeName,
        onGenerateRoute: (settings){
          Object? arguments = settings.arguments;

          switch(settings.name){
            case AboutMe.routeName:
              return PageRouteBuilder(pageBuilder: (context, anim, anim2){
                return AboutMe();
              });
            case Resume.routeName:
              return PageRouteBuilder(pageBuilder: (context, anim, anim2){
                return Resume();
              });
            case Portfolio.routeName:
              return PageRouteBuilder(pageBuilder: (context, anim, anim2){
                return Portfolio();
              });
            case Contact.routeName:
              return PageRouteBuilder(pageBuilder: (context, anim, anim2){
                return Contact();
              });
          }
        },
      )
    );
  }
}