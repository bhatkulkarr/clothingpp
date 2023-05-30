import 'package:flutter/material.dart';


class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(child: Image.asset("assets/welcome_banner_new.png"));
  }
}