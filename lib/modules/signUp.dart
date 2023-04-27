import 'package:flutter/material.dart';
import 'package:signing_in_and_up/modules/signIn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final phoneController = TextEditingController();
  final confPasswordController = TextEditingController();
  final focusName = FocusNode();
  final focusEmail = FocusNode();
  final focusPassword = FocusNode();
  final focusConfPassword = FocusNode();
  final focusPhone = FocusNode();
  bool _confPasswordVisible = false;
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Serif', color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.white,
      body: ListView(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 50, 15, 5),
            child: TextFormField(
              controller: nameController,
              focusNode: focusName,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                ),
                hintText: "Name",
                hintStyle: const TextStyle(
                    fontFamily: 'Serif', color: Colors.grey),
                focusedBorder: OutlineInputBorder(borderSide:
                const BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(12)),
                fillColor: Colors.grey.shade100,
                filled: true,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
            child: TextFormField(
              controller: phoneController,
              focusNode: focusPhone,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                ),
                hintText: "Phone Number",
                hintStyle: const TextStyle(
                    fontFamily: 'Serif', color: Colors.grey),
                focusedBorder: OutlineInputBorder(borderSide:
                const BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(12)),
                fillColor: Colors.grey.shade100,
                filled: true,

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 10),
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
                    fontFamily: 'Serif', color: Colors.grey),
                focusedBorder: OutlineInputBorder(borderSide:
                const BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(12)),
                fillColor: Colors.grey.shade100,
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
                    fontFamily: 'Serif', color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(borderSide:
                const BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(12)),
                fillColor: Colors.grey.shade100,
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
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
            child: TextFormField(
              controller: confPasswordController,
              focusNode: focusConfPassword,
              obscureText: !_confPasswordVisible,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                hintStyle: const TextStyle(
                    fontFamily: 'Serif', color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(borderSide:
                const BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(12)),
                fillColor: Colors.grey.shade100,
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    _confPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.indigo,
                  ),
                  onPressed: () {
                    setState(() {
                      _confPasswordVisible = !_confPasswordVisible;
                    });
                  },
                ),


              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),),
                onPressed: () async
                {

                  // That's it to display an alert, use other properties to customize.
                },
                child: Text('Sign Up')),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const SizedBox(width: 25,),
              const Text('if you already have account ',
                  style: TextStyle(fontSize: 16)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
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
        ],
      ),
    );
  }
}