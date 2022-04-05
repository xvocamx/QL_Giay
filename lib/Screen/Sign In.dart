import 'package:flutter/material.dart';
import 'package:ql_giay/Screen/Home.dart';
import 'package:ql_giay/Screen/Sign%20Up.dart';
import 'package:ql_giay/Service/AuthenticationService.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationService authenticationService = AuthenticationService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Image(
                  image: AssetImage('assets/logo.jpeg'),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) => value!.isEmpty ? "Please enter Email" : null,
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  validator: (value) => value!.isEmpty ? "Please enter Password" : null,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
                Container(
                  constraints:
                  BoxConstraints.loose(const Size(double.infinity, 50)),
                  alignment: AlignmentDirectional.centerEnd,
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Text(
                      "Forgot password ?",
                      style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    child: const Text(
                      "Sign In",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        authenticationService.signIn(emailController.text.trim(), passwordController.text.trim());
                        Navigator.popAndPushNamed(context, '/home');
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
                      "Don't have an account ?", style: TextStyle(fontSize: 18),),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/signUp');
                      },
                      child: const Text(
                        "Sign Up", style: TextStyle(fontSize: 18),),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
