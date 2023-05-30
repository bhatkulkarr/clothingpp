import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffFEFEFE),
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Profile",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 22,color: CustomColors.primaryColor)),
                  trailing: CircleAvatar(
                        radius: 20,
                      child: Icon(Icons.person,color: CustomColors.primaryColor)
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text("Rajat Bhatkulkar",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 22)),
                          subtitle: Text("+91 8408 0205 59",style: GoogleFonts.robotoSlab()),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          trailing: FaIcon(FontAwesomeIcons.box,color: CustomColors.primaryColor),
                          title: Text("Orders Histroy",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 18),),
                        ),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          trailing: FaIcon(FontAwesomeIcons.heart,color: CustomColors.primaryColor),
                          title: Text("Wishlist",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 18)),
                        ),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          trailing: FaIcon(FontAwesomeIcons.wallet,color: CustomColors.primaryColor,),
                          title: Text("Payments",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 18)),
                        ),

                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          trailing: Icon(Icons.settings,color: CustomColors.primaryColor,weight: 20,),
                          title: Text("Manage Account",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 18)),
                        ),

                        ListTile(
                          onTap: (){
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (_) {
                              return LoginScreen();
                            }));

                          },
                          contentPadding: EdgeInsets.zero,
                          trailing: Icon(Icons.power_settings_new_outlined,color: CustomColors.primaryColor,weight: 20,),
                          title: Text("Logout",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 18)),
                        )

                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}
