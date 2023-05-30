import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductCard extends StatelessWidget {
   ProductCard({
    super.key,
    required this.name,
    required this.price,
  });

  final String price;
  final String name;
  String? ruppes = "₹";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding:
        const EdgeInsets
            .only(
            left: 5.0),
        child: ListTile(
          contentPadding:
          EdgeInsets.zero,
          title: Text(name,style: GoogleFonts.playfairDisplay(),),
          subtitle: Text(
              "${ruppes} ${price}",style: GoogleFonts.robotoSlab(fontSize: 18)),
        ),
      ),
    );
  }
}