import 'package:clothingapp/services/firestoreservices.dart';
import 'package:clothingapp/widgets/product_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class ProductHorizontalCarousel extends StatelessWidget {
   ProductHorizontalCarousel({
    super.key,
    required this.shopcontainerheight,
    required this.shopcontainerwidth,
    required this.producthotoheight,
    required this.ruppes,
  });

  final double shopcontainerheight;
  final double shopcontainerwidth;
  final double producthotoheight;
  final String? ruppes;

  FirestoreServices firestoreServices = new FirestoreServices();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height:
        MediaQuery.of(context).size.height * 0.25,
        child: StreamBuilder<QuerySnapshot>(
          stream: firestoreServices.getTrendProduct("trending"),
          builder: (context,snapshot){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Material(
                      elevation: 2,
                      borderRadius:
                      BorderRadius.circular(15.0),
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(
                          height: shopcontainerheight,
                          width: shopcontainerwidth,
                          child: Column(
                            children: [
                              Container(
                                height: producthotoheight,
                                child: Image.network("https://rukminim1.flixcart.com/image/832/832/kt8zb0w0/t-shirt/r/t/q/m-tshirt-spider-sky-d-fashion-original-imag6n2fgtmyxpgz.jpeg?q=70"),
                              ),
                              ProductCard(name: doc['name'],price: doc['price'],)
                            ],
                          ),
                        ),
                      ),
                    ));
              }
          );
          }
        ),
      ),
    );
  }
}

