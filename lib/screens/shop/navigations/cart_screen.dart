import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/screens/shop/product/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  ScrollController _scrollBottomBarController = new ScrollController();
  String? ruppes = "₹";

  @override
  Widget build(BuildContext context) {

    double containerheight = MediaQuery.of(context).size.height * 0.14;
    double containerwidth = MediaQuery.of(context).size.width * 0.99;
    double shopdetailsheight = MediaQuery.of(context).size.height * 0.05;
    double shopdetailswidth = MediaQuery.of(context).size.width * 0.60;
    double bottomContainer = MediaQuery.of(context).size.height * 0.07;
    double deleteButtonWidth = MediaQuery.of(context).size.width * 0.40;
    double qtyContainerWidth = MediaQuery.of(context).size.width * 0.60;
    return  Material(
      color: Color(0xffFEFEFE),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: ListTile(
                title: Text("Cart",style: GoogleFonts.playfairDisplay(fontWeight: FontWeight.bold,fontSize: 22,color: CustomColors.primaryColor)),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:  15,
                controller: _scrollBottomBarController,
                itemBuilder: (context, index)  {
                  return Card(
                    child: Material(
                      color: Color(0xffFEFEFE),
                      elevation: 1.0,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                            height: containerheight,
                            width: containerwidth,
                            child: Row(
                              children: [
                                Material(
                                  //elevation:5,
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Container(
                                      child: Image.network("https://rukminim1.flixcart.com/image/832/832/kt8zb0w0/t-shirt/r/t/q/m-tshirt-spider-sky-d-fashion-original-imag6n2fgtmyxpgz.jpeg?q=70")),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),

                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text("Mens T-shirt",style: GoogleFonts.playfairDisplay(
                                              fontSize: 18,fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            width: deleteButtonWidth,
                                          ),
                                          Icon(Icons.delete,color: Colors.redAccent,)
                                        ],
                                      ),
                                      Text("Size: M",style: GoogleFonts.robotoSlab(
                                          fontSize: 18)),
                                      Container(
                                        height: shopdetailsheight,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: qtyContainerWidth,
                                              child: Row(
                                                children: [
                                                  Text("Qty",style: GoogleFonts.robotoSlab(
                                                      fontSize: 18)),
                                                  Container(
                                                      child: IconButton(
                                                        icon: FaIcon(
                                                          FontAwesomeIcons
                                                              .minusSquare,
                                                          color: Colors.redAccent,
                                                        ),
                                                        onPressed: () {


                                                        },
                                                      )),
                                                  Text(
                                                    "2",
                                                    style: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                  Container(
                                                    child: IconButton(
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.plusSquare,
                                                        color: CustomColors.primaryColor,
                                                      ),
                                                      onPressed: (){


                                                      },
                                                    ),

                                                  ),
                                                ],
                                              ),
                                            ),
                                            Text("${ruppes} 500",style: GoogleFonts.robotoSlab(
                                                fontSize: 18))



                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: bottomContainer,
              color: CustomColors.primaryColor,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "1 Items",
                            style: GoogleFonts.robotoSlab(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)
                        ),
                      )),

                  Container(
                    height: bottomContainer,
                    child: OutlinedButton(
                      onPressed: () async {


                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return CheckoutScreen();
                        }));

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0))),
                      ),
                      child: Text("$ruppes ${1200} Checkout",style: GoogleFonts.robotoSlab(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
