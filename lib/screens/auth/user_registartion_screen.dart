
import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/screens/auth/login_screen.dart';
import 'package:clothingapp/services/authentication.dart';
import 'package:clothingapp/services/firestoreservices.dart';
import 'package:clothingapp/size_configs.dart';
import 'package:clothingapp/widgets/my_inputbox_widget.dart';
import 'package:clothingapp/widgets/my_passwordinputbox_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<UserRegistrationScreen> createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {

  TextEditingController nameTextController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailTextController = new TextEditingController();
  TextEditingController passwordTextController = new TextEditingController();
  TextEditingController retypepasswordTextController = new TextEditingController();
  bool? checkBoxValue = false;

  String errorString = "";
  bool errorStatus= false;

  bool showPassword = true;
  bool showRePassword = true;

  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFEFEFE),
        body: Container(
          child: ListView(
            children: [
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text("Create your account",style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: CustomColors.primaryColor
                ),),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: MyInputBoxWidget(
                      textController: nameTextController,
                      textInputType: TextInputType.text,
                      hintText: 'Full Name',
                      prefixIcon: Icons.person,
                      obsureStatus: false)),
              SizedBox(
                height: 30,
              ),

              Center(
                  child: MyInputBoxWidget(
                      textController: emailTextController,
                      textInputType: TextInputType.emailAddress,
                      hintText: 'Email',
                      prefixIcon: Icons.email,
                      obsureStatus: false)),
              SizedBox(
                height: 30,
              ),

              Center(
                  child: MyInputBoxWidget(
                      textController: phoneNumberController,
                      textInputType: TextInputType.number,
                      hintText: 'Phone Number',
                      prefixIcon: Icons.phone,
                      obsureStatus: false)),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0,left: 20),
                  child: TextField(
                    controller: passwordTextController,
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
                height: 30,
              ),


              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0,left: 20),
                  child: TextField(
                    controller: retypepasswordTextController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showRePassword,
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
                        hintText: 'ReType Password',
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
                              if(showRePassword){
                                setState(() {
                                  showRePassword = false;
                                });
                              }else if(!showRePassword){
                                setState(() {
                                  showRePassword = true;
                                });
                              }
                            },
                            child: Icon(Icons.remove_red_eye_rounded,color: CustomColors.primaryColor,)
                        )
                    ),
                  ),
                ),
              ),


              CheckboxListTile(
                title: Text("I agree to all terms and policy",style: GoogleFonts.playfairDisplay(color: Colors.blue),),
                value: checkBoxValue,
                checkColor: Colors.white,
                onChanged: (newValue) {
                  setState(() {
                    checkBoxValue = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
              SizedBox(
                height: 15,
              ),
              Visibility(
                  visible: errorStatus,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0,left: 20),
                    child: Text(errorString,style: GoogleFonts.playfairDisplay(color: Colors.redAccent),),
                  )
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
                        print("name ${nameTextController.text.toString()}");
                        print("email ${emailTextController.text.toString()}");
                        print("phonenumber ${phoneNumberController.text.toString()}");
                        print("password ${passwordTextController.text.toString()}");
                        print("retypepassword ${retypepasswordTextController.text.toString()}");

                        if(nameTextController.text.isEmpty || emailTextController.text.isEmpty || passwordTextController.text.isEmpty || retypepasswordTextController.text.isEmpty){
                              setState(() {
                                errorStatus = true;
                                errorString = "All feilds are mandatory";
                              });
                        }else if(passwordTextController.text.toString() != retypepasswordTextController.text.toString()){
                          setState(() {
                            errorStatus = true;
                            errorString = "Password should be matched";
                          });
                        }else if(checkBoxValue == false){
                          setState(() {
                            errorStatus = true;
                            errorString = "Please agree to terms and condiions";
                          });
                        }else {
                          User user = await _auth.registerUser(emailTextController.text.toString(),passwordTextController.text.toString());
                          if(user!= null){
                            FirestoreServices firestoreauth = new FirestoreServices();
                            firestoreauth.saveUserData(uid: user.uid,email: emailTextController.text.toString(),conatct: phoneNumberController.text.toString(),name: nameTextController.text.toString());

                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/userscreen');
                            print("${user.uid} logged in successfully");

                          }
                        }


                      },
                      child: Text(
                        'Create Account',
                        style: GoogleFonts.playfairDisplay(
                            fontSize: 22, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: CustomColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                  child: InkWell(
                      onTap: (){

                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/login');

                      },
                      child: Text(
                        "Already Have an account ? ",
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
