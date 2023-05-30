
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService{
  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future registerUser(String email,String password) async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;

      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      print("Result: ${result.toString()}");
      return user;
    }catch (exception) {
      print(exception.toString());
      return null;
    }

  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {

      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print("Printing Result ${result}");
      User? user = result.user;
      return user;
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (exception) {
      print(exception.toString());
      return null;
    }
  }

}