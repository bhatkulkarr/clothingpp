import 'package:clothingapp/constants/colors.dart';
import 'package:clothingapp/screens/shop/product/product_listview_screen.dart';
import 'package:clothingapp/services/firestoreservices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CategoryWidget extends StatelessWidget {
   CategoryWidget({Key? key,this.categoryStatus}) : super(key: key);
   FirestoreServices firestoreServices = new FirestoreServices();

   String? categoryStatus;

   List<String> womenCategory = [
    "Kurtas",
    "Skirt",
    "Dress",
    "Gown",
    "Cardigan"
  ];

   List<String> menCategory = [
     "T-shirts",
     "Polos",
     "Jeans",
     "Trousers",
     "Formal shirts"
   ];

   List<String> womenCategoryImg = [
     "assets/womencategory/kurtas_category.jpg",
     "assets/womencategory/skirt_category.jpg",
     "assets/womencategory/dress_category.jpg",
     "assets/womencategory/gown_category.jpg",
     "assets/womencategory/jacket_category.jpg"
   ];

   List<String> menCategoryImg = [
     "assets/mencategory/tshirt_category.jpg",
     "assets/mencategory/polo_category.jpg",
     "assets/mencategory/jeans_category.jpg",
     "assets/mencategory/trouser_category.jpg",
     "assets/mencategory/formal_category.png",
   ];


   //Stream<QuerySnapshot<Map<String, dynamic>>> femaleCategoryStream = FirebaseFirestore.instance.collection("category").where("gender", isEqualTo: "female").snapshots();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
          stream: firestoreServices.getCategory(categoryStatus),
          builder:  (context,snapshot){
          return GridView.builder(
            itemCount: snapshot.data!.docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 2.0),
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot doc = snapshot.data!.docs[index];
              print("Document ID: ${doc.id.toString()}");

              return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Material(
                    elevation: 1,
                    child: GestureDetector(
                      onTap: () {

                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return ProductListViewScreen(categoryName: doc['name'],docId: doc.id.toString());
                        }));

                      },
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                                child: Image.asset(categoryStatus == "women"? womenCategoryImg[index] : menCategoryImg[index])),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(doc['name'],style: GoogleFonts.playfairDisplay(color: CustomColors.primaryColor,fontSize: 18),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
            });
           }
      ),
    );
  }
}
