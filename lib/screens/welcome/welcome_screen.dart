import 'package:clothingapp/size_configs.dart';
import 'package:clothingapp/widgets/get_started_button.dart';
import 'package:clothingapp/widgets/welcome_banner.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
      children: [
        WelcomeBanner(),
        GetStartedButton(),
        SizedBox(
          height: 20,
        )
      ],
        ),
      ),
    );
  }
}
