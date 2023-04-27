import 'package:flutter/material.dart';
import 'package:signing_in_and_up/modules/signUp.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final focusEmail = FocusNode();
  final focusPassword = FocusNode();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool _passwordVisible = false;
  var formKey1 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusPassword.unfocus();
        focusEmail.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Login With Email',
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
                  padding: const EdgeInsets.fromLTRB(40, 200, 40, 20),
                  child: TextFormField(
                    controller: emailController,
                    focusNode: focusEmail,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                          fontFamily: 'Serif', color: Colors.indigo),
                      focusedBorder: OutlineInputBorder(borderSide:
                      const BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.grey.shade100,
                      filled: true,

                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                  child: TextFormField(
                    controller: passController,
                    focusNode: focusPassword,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                          fontFamily: 'Serif', color: Colors.indigo),
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
                      focusedBorder: OutlineInputBorder(borderSide:
                      const BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.grey.shade100,
                      filled: true,

                    ),
                  ),
                ),
                const SizedBox(height: 15,),


                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),),

                  onPressed: () async
                  {},

                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Serif', color: Colors.white)),

                  ),),
                Row(
                  children: [
                    const SizedBox(width: 30,),
                    const Text("if you don't have an  account ",
                        style: TextStyle(fontSize: 16)),
                    TextButton(
                      onPressed: () async {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
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