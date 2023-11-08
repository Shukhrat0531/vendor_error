import 'package:flutter/material.dart';
import 'package:vendor_last_app/vendor/views/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String email;
  late String fullname;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Пожалюста емайл не должен быть пустым';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: "Email address",
                        hintText: "Enter your email address",
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      fullname = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Пожалюста имя не должен быть пустым';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: "Full name",
                        hintText: "Enter your full name",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                     
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Пожалуста парол не должен быть пустым';
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                     
                      
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width - 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: const Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: const Text('Alrade a have accounte '))
                ],
              ),
            ),
          ),
        ),
    );
  }
}