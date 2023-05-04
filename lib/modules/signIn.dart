import 'package:flutter/material.dart';
import 'package:signing_in_and_up/modules/signUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final focusEmail = FocusNode();
    final focusPassword = FocusNode();
    var emailController = TextEditingController();
    var passController = TextEditingController();
    bool _passwordVisible = false;


    return GestureDetector(
            onTap: () {
              focusPassword.unfocus();
              focusEmail.unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text('Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Serif', color: Colors.white)),
                backgroundColor: Colors.indigo,
              ),
              body:
              SingleChildScrollView(
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 150, 15, 10),
                        child: TextFormField(
                          controller: emailController,
                          focusNode: focusEmail,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.indigo),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            hintText: "Email",
                            hintStyle: const TextStyle(
                                fontFamily: 'Serif', color: Colors.indigo),
                            focusedBorder: OutlineInputBorder(borderSide:
                            const BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Colors.white,
                            filled: true,

                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                        child: TextFormField(
                          controller: passController,
                          focusNode: focusPassword,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: const TextStyle(
                                fontFamily: 'Serif', color: Colors.indigo),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.indigo),
                                borderRadius: BorderRadius.circular(25)
                            ),
                            focusedBorder: OutlineInputBorder(borderSide:
                            const BorderSide(color: Colors.indigo),
                                borderRadius: BorderRadius.circular(10)),
                            fillColor: Colors.white,
                            filled: true,


                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.indigo,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
                        child: ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),),
                            onPressed: () {

                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(130, 15, 130, 15),
                              child: Text(
                                'Sign In', style: TextStyle(fontSize: 17),),
                            )),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 30,),
                          const Text("if you don't have an  account ",
                              style: TextStyle(fontSize: 16)),
                          TextButton(
                            onPressed: () async {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (
                                          context) => const HomeScreen()));
                            },
                            child: const Text(
                              'click here',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.indigo,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
          );
  }
}

