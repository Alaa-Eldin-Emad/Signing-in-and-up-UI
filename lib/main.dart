import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signing_in_and_up/modules/signIn.dart';
import 'modules/signUp.dart';

void main()async
{

  WidgetsFlutterBinding.ensureInitialized();

  runApp( const MaterialApp (home: LoginScreen()));
}



