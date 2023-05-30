import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/widgets/product_horizontal_carousel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? ruppes = "₹";

  @override
  Widget build(BuildContext context) {
    double shopcontainerheight = MediaQuery.of(context).size.height * 0.25;
    double shopcontainerwidth = MediaQuery.of(context).size.width * 0.40;
    double shopphotoheight = MediaQuery.of(context).size.width * 0.25;
    double producthotoheight = MediaQuery.of(context).size.width * 0.25;

    return Material(
      color: Color(0xffFEFEFE),
      child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                            radius: 25,
                            child: Icon(Icons.person_rounded,size: 35,color: CustomColors.primaryColor,)
                        ),
                        trailing: Icon(Icons.notifications,size: 35,color: CustomColors.primaryColor,),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                            child: Text(
                              'Explore Fashion',
                              style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 18),
                            ),
                          ),

                          TextField(
                            //controller: textController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(width:1,color: CustomColors.primaryColor)
                              ),
                              focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(width:1,color: CustomColors.primaryColor),
                              ),
                              hintText: 'Explore Fashion here',
                              hintStyle: GoogleFonts.playfairDisplay(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
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
                                    child: Icon(Icons.search,
                                      color: CustomColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Container(
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  aspectRatio: 1.5,
                                  scrollDirection: Axis.horizontal,
                                  autoPlay: true,
                                ),
                                items: [Image.asset("assets/fashion_banner.jpg"),Image.asset("assets/boys_banner.jpg")],
                              )),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text("Featured Product",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 18),),
                          ),
                          ProductHorizontalCarousel(shopcontainerheight: shopcontainerheight, shopcontainerwidth: shopcontainerwidth, producthotoheight: producthotoheight, ruppes: ruppes),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0,top: 12),
                            child: Text("Top Selling Product",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 18),),
                          ),
                          ProductHorizontalCarousel(shopcontainerheight: shopcontainerheight, shopcontainerwidth: shopcontainerwidth, producthotoheight: producthotoheight, ruppes: ruppes)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}


