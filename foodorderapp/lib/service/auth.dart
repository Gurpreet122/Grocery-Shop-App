import "package:firebase_auth/firebase_auth.dart";


class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser()  {
    return  auth.currentUser;
  }

  Future signOut()async{
    await FirebaseAuth.instance.signOut();
  }

  Future deleteUser()async{
    User? users= FirebaseAuth.instance.currentUser;
    users?.delete();

  }

}
