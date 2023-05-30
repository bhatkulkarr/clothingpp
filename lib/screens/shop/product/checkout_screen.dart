import 'package:clothingapp/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}
enum PaymentOption { CARD, UPI, COD }


class _CheckoutScreenState extends State<CheckoutScreen> {
  PaymentOption? _character = PaymentOption.CARD;
  String? ruppes = "₹";

  @override
  Widget build(BuildContext context) {
    double bottomContainer = MediaQuery.of(context).size.height * 0.07;
    DateTime now = DateTime.now();
    //String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return Scaffold(
        appBar: AppBar(
        title: Text("Checkout",
            style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: CustomColors.primaryColor)),
       ),
        body: Container(
          color: Color(0xffFEFEFE),
            child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        children: [
                          Material(
                            elevation: 3.0,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: 8, top: 8),
                                      child: Text(
                                        "Payment Options",
                                          style: GoogleFonts.playfairDisplay(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: CustomColors.primaryColor)
                                      )),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: ListTile(
                                      enabled: _character ==  PaymentOption.CARD ? true : false,
                                      contentPadding: EdgeInsets.only(left: 8),
                                      leading: Radio(
                                        value: PaymentOption.CARD,
                                        groupValue: _character,
                                        onChanged: (value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        },
                                      ),
                                      title: Text("Card", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                      subtitle:
                                      Text("Pay with any international and domestic card", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: ListTile(
                                      enabled: _character ==  PaymentOption.UPI ? true : false,
                                      contentPadding: EdgeInsets.only(left: 8),
                                      leading: Radio(
                                        groupValue: _character,
                                        value: PaymentOption.UPI,
                                        onChanged: (value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        },
                                      ),
                                      title: Text("UPI", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                      subtitle: Text(
                                          "Pay using your favourite UPI app Gpay / PhonePe", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: ListTile(
                                      enabled: _character ==  PaymentOption.COD ? true : false,
                                      contentPadding: EdgeInsets.only(left: 8),
                                      leading: Radio(
                                        groupValue: _character,
                                        value: PaymentOption.COD,
                                        onChanged: (value) {
                                          setState(() {
                                            _character = value;
                                          });
                                        },
                                      ),
                                      title: Text("COD", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                      subtitle: Text(
                                          "Pay cash at the time of delivery", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 3.0,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 8, top: 8, bottom: 5),
                                      child: Text(
                                        "Price Details",
                                          style: GoogleFonts.playfairDisplay(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: CustomColors.primaryColor)
                                      )),
                                  Divider(
                                    thickness: 0.5,
                                    color: Colors.blueGrey,
                                    height: 1.0,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: ListTile(
                                      title: Text("Total Items", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                      trailing:
                                      Text("4", style: GoogleFonts.robotoSlab(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: ListTile(
                                      title: Text("Price", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                      trailing: Text(
                                          "$ruppes ${10000}", style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: ListTile(
                                      title: Text("Discount", style: GoogleFonts.playfairDisplay(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                      trailing: Text("$ruppes 0.0", style: GoogleFonts.robotoSlab(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                    ),
                                  ),
                                  // Container(
                                  //   height: MediaQuery.of(context).size.height*0.05,
                                  //   child: ListTile(
                                  //     title: Text("Delivery Charges"),
                                  //     trailing: Text("Free"),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 0.8,
                                    color: Colors.blueGrey,
                                    height: 1.0,
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    child: ListTile(
                                      title: Text(
                                        "Total Amount", style: GoogleFonts.playfairDisplay(
                                      fontWeight: FontWeight.bold,
                                          fontSize: 16)
                                      ),
                                      trailing: Text(
                                          "$ruppes ${10000}", style: GoogleFonts.robotoSlab(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: true,
                    child: Container(
                      height: bottomContainer,
                      color: Colors.blueGrey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Total Bill", style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 16)
                                ),
                              )),
                          Expanded(
                            child: Container(
                                height: bottomContainer,
                                child: OutlinedButton(
                                  onPressed: () async {
                                    showDialog<void>(
                                      context: context,
                                      barrierDismissible:
                                      false, // user must tap button!
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Are you sure?'),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Text(
                                                    'Did you want to confirm order.'),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: Text('Confirm'),
                                              onPressed: () async {

                                              },
                                            ),
                                            TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(2.0))),
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                          Colors.redAccent)),
                                  child: Text(
                                      "$ruppes ${1000} Place Order", style: GoogleFonts.robotoSlab(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16)),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
          ),
        ));
  }
}
