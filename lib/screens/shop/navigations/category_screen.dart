import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/services/firestoreservices.dart';
import 'package:clothingapp/widgets/category_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  String? categoryChoice = "women";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xffFEFEFE),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Category",
                      style: GoogleFonts.playfairDisplay(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: CustomColors.primaryColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text("Choose Trending Products For Your Category",
                      style: GoogleFonts.playfairDisplay(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: CustomColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              categoryChoice = "women";
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xffFEFEFE),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                                child: Text("Women",
                                    style: GoogleFonts.playfairDisplay(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.primaryColor))),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              categoryChoice = "men";
                            });
                          },
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xffFEFEFE),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Center(
                                child: Text("Men",
                                    style: GoogleFonts.playfairDisplay(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: CustomColors.primaryColor))),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(child: Container(child: CategoryWidget(categoryStatus: categoryChoice)))
            ],
          ),
        ),
      ),
    );
  }
}
