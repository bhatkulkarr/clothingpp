import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/screens/auth/user_registartion_screen.dart';
import 'package:clothingapp/services/authentication.dart';
import 'package:clothingapp/size_configs.dart';
import 'package:clothingapp/widgets/get_started_button.dart';
import 'package:clothingapp/widgets/my_inputbox_widget.dart';
import 'package:clothingapp/widgets/my_passwordinputbox_widget.dart';
import 'package:clothingapp/widgets/welcome_banner.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwrodController = new TextEditingController();
  final AuthenticationService _auth = AuthenticationService();
  String errorString = "";
  bool errorStatus= false;
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFEFEFE),
        body: Container(
        // decoration: BoxDecoration(
        // image: DecorationImage(
        // image: AssetImage("assets/login_background.png"),
        // fit: BoxFit.cover,
        // )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Sign In with Email",style: GoogleFonts.playfairDisplay(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: CustomColors.primaryColor
                ),),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                  child: MyInputBoxWidget(
                      textController: emailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'Email Address',
                      prefixIcon: Icons.email,
                      obsureStatus: false)),
              SizedBox(
                height: 30,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0,left: 20),
                  child: TextField(
                    controller: passwrodController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(width:1,color: CustomColors.primaryColor)
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(width:1,color: CustomColors.primaryColor),
                        ),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.playfairDisplay(),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            // height: 60,
                            // this container height is causing the error
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: CustomColors.primaryColor,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              child: Icon(Icons.password_sharp,
                                color: CustomColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: (){
                            if(showPassword){
                              setState(() {
                                showPassword = false;
                              });
                            }else if(!showPassword){
                              setState(() {
                                showPassword = true;
                              });
                            }

                          },
                            child: Icon(Icons.remove_red_eye_rounded,color: CustomColors.primaryColor,)
                        )
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 15,
              ),
              Visibility(
                visible: errorStatus,
                  child: Text(errorString,style: GoogleFonts.playfairDisplay(color: Colors.redAccent),)
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    height: SizeConfig.blockSizeH! * 12.5,
                    width: SizeConfig.blockSizeH! * 100,
                    child: TextButton(
                      onPressed: () async {
                        print("email ${emailController.text.toString()}");
                        print("password ${passwrodController.text.toString()}");

                        if(emailController.text.isEmpty){
                          setState(() {
                            errorStatus = true;
                            errorString = "Email is required";
                          });
                        }else if(passwrodController.text.isEmpty){
                          setState(() {
                            errorStatus = true;
                            errorString = "Password is required";
                          });
                        }else {
                          setState(() {
                            errorStatus = false;
                          });
                          try {
                            User user = await _auth.signInWithEmailAndPassword(emailController.text.toString(), passwrodController.text.toString());
                            print("Printing user info ${user}");
                            if (user!= null) {
                              Navigator.pop(context);
                              Navigator.pushNamed(context, '/userscreen');
                              print("${user.uid} logged in successfully");
                            } else if(user == null) {
                              setState(() {
                                errorStatus = true;
                                errorString = "User Not Found";
                              });
                            }
                          } catch (e) {
                            print(e);
                          }
                        }

                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 22, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xff514697),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),

              Text("OR",style: GoogleFonts.playfairDisplay(
                fontSize: 16, color: CustomColors.primaryColor,fontWeight: FontWeight.bold)),

              Center(
                  child: InkWell(
                    onTap: (){

                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/registerscreen');

                    },
                      child: Text(
                "Create Account",
                style: GoogleFonts.playfairDisplay(
                    fontSize: 16, color: Colors.blue, decoration: TextDecoration.underline,),
              )))
            ],
          ),
        ),
      ),
    );
  }
}
