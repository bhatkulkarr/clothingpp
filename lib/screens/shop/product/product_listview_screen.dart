import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/screens/shop/product/product_view_screen.dart';
import 'package:clothingapp/services/firestoreservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ProductListViewScreen extends StatefulWidget {

  ProductListViewScreen({Key? key,required  this.categoryName,required this.docId}) : super(key: key);
  String categoryName;
  String docId;

  @override
  State<ProductListViewScreen> createState() => _ProductListViewScreenState();
}

class _ProductListViewScreenState extends State<ProductListViewScreen> {

  FirestoreServices firestoreServices = new FirestoreServices();

  String? ruppes = "₹";

  List<String> womenCategory = [
    "Kurtas",
    "Skirt",
    "Dress",
    "Gown",
    "Cardigan"
  ];

  List<String> womenCategoryImg = [
    "assets/womencategory/kurtas_category.jpg",
    "assets/womencategory/skirt_category.jpg",
    "assets/womencategory/dress_category.jpg",
    "assets/womencategory/gown_category.jpg",
    "assets/womencategory/jacket_category.jpg"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreServices.getProduct(widget.docId),
          builder: (context,snapshot){
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 4.0),
              itemBuilder: (BuildContext context, int index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];

                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Material(
                      elevation: 1,
                      child: GestureDetector(
                        onTap: () {

                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ProductViewScreen(productImgUrl: womenCategoryImg[index],productName: doc['name'],productPrice: doc['price']);
                          }));

                        },
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Image.asset(womenCategoryImg[index])),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text( doc['name'],style: GoogleFonts.playfairDisplay(color: CustomColors.primaryColor,fontSize: 16,fontWeight: FontWeight.bold)),
                                      Text("${ruppes} ${doc['price']}",style: GoogleFonts.robotoSlab(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ));
              });
          }
        ),
      ),
    );
  }
}
