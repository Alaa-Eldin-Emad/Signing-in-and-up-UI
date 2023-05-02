import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:signing_in_and_up/modules/signIn.dart';
import 'package:http/http.dart' as http;
Future<Album> createAlbum(String email,String password) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:8000/signup'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final int id;
  final String email;
  final String password;

  const Album({required this.id, required this.email,required this.password});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      email: json['email'],
      password: json['password'],
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Album>? _futureAlbum;
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
    return GestureDetector(
      onTap: (){focusEmail.unfocus();focusConfPassword.unfocus();focusName.unfocus();focusPassword.unfocus();focusPhone.unfocus();},
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up',
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
                      borderSide: const BorderSide(color: Colors.indigo),
                    borderRadius: BorderRadius.circular(25),

                  ),
                  hintText: "Name",
                  hintStyle: const TextStyle(
                      fontFamily: 'Serif', color: Colors.indigo),
                  focusedBorder: OutlineInputBorder(borderSide:
                  const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white10,
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
                      borderSide: const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  hintText: "Phone Number",
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
                controller: emailController,
                focusNode: focusEmail,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.indigo),
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
                      borderSide: const BorderSide(color: Colors.indigo),
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
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
              child: TextFormField(
                controller: confPasswordController,
                focusNode: focusConfPassword,
                obscureText: !_confPasswordVisible,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(
                      fontFamily: 'Serif', color: Colors.indigo),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  focusedBorder: OutlineInputBorder(borderSide:
                  const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.white,
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
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ElevatedButton(style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),),
                  onPressed: ()
                  {
                    if (_futureAlbum == null)
                    {_futureAlbum = createAlbum(emailController.text,passController.text);}
                    else{ buildFutureBuilder();
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                    child: Text('Sign Up',style: TextStyle(fontSize: 17),),
                  )),
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
      ),
    );
  }
  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.email+snapshot.data!.password);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}