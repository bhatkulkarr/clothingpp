import 'package:clothingapp/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedButton extends StatelessWidget {
   GetStartedButton({
    super.key,
  });
 // List<Color> gradinents  = [Color(0xff5271FF),Color(0xff050535)]
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23,right: 23),
      child: InkWell(
        onTap: (){

          final FirebaseAuth _auth = FirebaseAuth.instance;

          if(_auth.currentUser != null){
            Navigator.pop(context);
            Navigator.pushNamed(context, '/userscreen');
          }else{
            Navigator.pop(context);
            Navigator.pushNamed(context, '/login');
          }

        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff514697),Color(0xff050535)],
            ),
             ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Get Started",
                  style: GoogleFonts.playfairDisplay(
                      color: Colors.white, fontSize: 30
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}