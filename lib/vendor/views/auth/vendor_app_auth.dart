import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vendor_last_app/vendor/views/auth/login_screen.dart';

class VendorAuthScreen extends StatefulWidget {
  const VendorAuthScreen({super.key});

  @override
  State<VendorAuthScreen> createState() => _VendorAuthScreenState();
}

class _VendorAuthScreenState extends State<VendorAuthScreen> {

  Future<FirebaseApp> _initFirebase()async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initFirebase(), 
      builder: (context , snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return LoginScreen();
        }
        return Center(child: CircularProgressIndicator(),);
      }
      );
  
  }
}