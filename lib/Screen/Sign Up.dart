import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ql_giay/Service/AuthenticationService.dart';
import 'package:ql_giay/validation.dart';

import 'Sign In.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  AuthenticationService authenticationService = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (value) => value!.isEmpty ? "Please enter Email" : null,
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: const Icon(Icons.email,color: Color(0xff606470)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (String? value) => value!.isEmpty ? "Please enter name" : null,
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: "Name",
                        prefixIcon: const Icon(Icons.person,color: Color(0xff606470)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (String? value) => value!.isEmpty ? "Please enter address" : null,
                    controller: addressController,
                    decoration: InputDecoration(
                        labelText: "Address",
                        prefixIcon: const Icon(Icons.location_on,color: Color(0xff606470)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (String? value) => value!.isEmpty ? "Please enter phone" : null,
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                        labelText: "Phone",
                        prefixIcon: const Icon(Icons.phone,color: Color(0xff606470)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (String? value) => value!.isEmpty ? "Please enter password" : null,
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock,color: Color(0xff606470)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    validator: (String? value) {
                      if(value == null || value.trim().isEmpty){
                        return "Please enter Confirm Password";
                      }
                      if(passwordController.text != value) {
                        return "Password don't match";
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",
                        prefixIcon: const Icon(Icons.lock,color: Color(0xff606470)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          authenticationService.signUp(
                              emailController.text,
                              passwordController.text,
                              nameController.text,
                              addressController.text,
                              phoneController.text,
                              context
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an Account",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

