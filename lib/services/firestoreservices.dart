

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {

  Future saveUserData({String? uid, String? name, String? conatct, String? email}) async {
    try{
      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "name" : name,
        "contact" : conatct,
        "email": email,
      });

    }catch(e){
      print(e);
    }
  }

 Stream<QuerySnapshot<Map<String, dynamic>>> getCategory(String? gender) {

      Stream<QuerySnapshot<Map<String, dynamic>>> femaleCategoryStream = FirebaseFirestore
          .instance
          .collection("category")
          .where("gender", isEqualTo: gender)
          .snapshots();

      return femaleCategoryStream;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProduct(String? docId) {

    Stream<QuerySnapshot<Map<String, dynamic>>> productStream = FirebaseFirestore
        .instance
        .collection("product")
        .where("category", isEqualTo: docId)
        .snapshots();

    return productStream;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getTrendProduct(String trend) {

    Stream<QuerySnapshot<Map<String, dynamic>>> trendProductStream = FirebaseFirestore
        .instance
        .collection("product")
        .where("trend", isEqualTo: trend)
        .snapshots();

    return trendProductStream;
  }




}