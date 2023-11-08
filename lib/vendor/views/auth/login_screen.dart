import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendor_last_app/vendor/views/auth/profile.dart';
import 'package:vendor_last_app/vendor/views/auth/register_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  static Future<User?> loginUsingEmailPassword({required String email, required String password,required BuildContext context})async{
    FirebaseAuth auth = FirebaseAuth.instance; 
    User? user ;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      user =  userCredential.user;
    } catch (e) {
      print('user not found');
    }
    return user;
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LoginScreen"),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                hintText: "Enter your email address",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: "Enter your password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.blue,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: () async{
               User? user = await loginUsingEmailPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                  context: context
                );
                if(user != null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProfileScreen()));
                }
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4),
                  ),
                ),
              ),
            ),
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
            }, child: Text('Пройти Регестрацию'))
          ],
        ),
      ),
    );
  }
}
