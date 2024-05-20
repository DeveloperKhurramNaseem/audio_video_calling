import 'package:firebase_auth/firebase_auth.dart';

class UserAuthService{
  static UserAuthService? _instance;
  UserAuthService._internal();
  factory UserAuthService() => _instance ??= UserAuthService._internal();  

  User? get credentials => FirebaseAuth.instance.currentUser;
  FirebaseAuth get auth => FirebaseAuth.instance;

  void signInUser(String email , String password) async{
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  void registerUser(String email , String password) async{
     await auth.createUserWithEmailAndPassword(email: email, password: password);   
  }

  void signInWithGoogle() async{
    AuthProvider authProvider = GoogleAuthProvider();
    await auth.signInWithProvider(authProvider);    
  }
}