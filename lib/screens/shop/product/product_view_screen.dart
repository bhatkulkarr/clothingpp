import 'package:clothingapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductViewScreen extends StatefulWidget {
   ProductViewScreen({Key? key,required this.productImgUrl,required this.productName,required this.productPrice}) : super(key: key);

  String productImgUrl;
  String productName;
  String productPrice;

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  @override
  Widget build(BuildContext context) {
    double nameHeight = MediaQuery.of(context).size.height * 0.12;
    double scrollHeight = MediaQuery.of(context).size.height * 0.70;
    double imgeHeight = MediaQuery.of(context).size.height * 0.34;
    double bottomBarHeigth = MediaQuery.of(context).size.height * 0.07;
    double shopcontainerheight = MediaQuery.of(context).size.height * 0.25;
    double shopcontainerwidth = MediaQuery.of(context).size.width * 0.40;
    double shopphotoheight = MediaQuery.of(context).size.width * 0.25;
    double producthotoheight = MediaQuery.of(context).size.width * 0.25;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.productName),
      ),
      body: Container(
        child:  Column(
            children: [
              Container(
                height: nameHeight,
                child: ListTile(
                  title: Text(
                    widget.productName,
                  ),
                  subtitle: Container(
                    child: Text("A designer kurta from H&M for women."),
                  ),
                  trailing: FaIcon(
                    FontAwesomeIcons.shareAlt,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                height: scrollHeight,
                child: ListView(
                  children: [
                    Container(
                        height: imgeHeight,
                        child: GestureDetector(
                          onTap: () {

                          },
                          child: Image.asset(widget.productImgUrl,width: 200.0),
                        )),
                    SizedBox(
                      height: 35.0,
                    ),
                    ListTile(
                      title: Text(
                        widget.productName,
                      ),
                      subtitle: Text("Rs ${widget.productPrice}"),
                      trailing: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Qty",
                            ),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.minusCircle,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                // if (qtyvalue > 1) {
                                //   setState(() {
                                //     qtyvalue = qtyvalue - 1;
                                //   });
                                // }
                              },
                            ),
                            Text(
                              "3",
                            ),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.plusCircle,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                // setState(() {
                                //   if (qtyvalue < int.parse(pstock)) {
                                //     qtyvalue = qtyvalue + 1;
                                //   }
                                // });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      elevation: 2,
                      child: Container(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "About this product",
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                RichText(
                                    text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(text: "This is very good product"),
                                        ])),
                                SizedBox(
                                  height: 5.0,
                                ),
                              ],
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
//               height: bottomBarHeigth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: bottomBarHeigth,
                          child: OutlinedButton(
                            onPressed: () async {


                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(2.0))),
                                backgroundColor:
                                MaterialStateProperty.all(CustomColors.primaryColor)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: FaIcon(
                                      FontAwesomeIcons.heart,
                                      color: Colors.white,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Add To Fav",
                                        style: GoogleFonts.playfairDisplay(color: Colors.white,fontWeight: FontWeight.bold)
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: bottomBarHeigth,
                          child: OutlinedButton(
                            onPressed: () async {

                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(2.0))),
                                backgroundColor: MaterialStateProperty.all(Colors.redAccent)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: FaIcon(
                                      FontAwesomeIcons.shoppingCart,
                                      color: Colors.white,
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Text(
                                      "Add To Cart",
                                      style: GoogleFonts.playfairDisplay(color: Colors.white,fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
