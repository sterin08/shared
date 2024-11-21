// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
 final _controllerEmail =TextEditingController();
 final _controllerpassword =TextEditingController();
 bool _reminder = false;

  @override
  Void initState() {
    super.initState();
    _loadCredentials();

  }
   Future <void> _loadCredentials()async {
    SharedPreferences prefs =
               await SharedPreferences.getInstance();
               setState(() {
                _controllerEmail.text =prefs.getString('email')?? '';
                 _controllerpassword.text =prefs.getString('password')?? '';
                 _reminder = prefs.getBool('reminder')?? true;

               });
   }
    
    }
  }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in to Your Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              
              decoration: InputDecoration(labelText: 'Your Email Address'),
            ),
            TextField(
              controller: _controllerpassword,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Your Password'),
            ),
            Row(
              children: [
                Checkbox(
                  value: _reminder,
                  onChanged: (value) {
                    setState(() {
                      _reminder = value!;
                    });
                  },
                ),
                Text('Remember Me'),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _saveCredentials();
              },
              child: Text('Sign In'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}

  
