import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ew/main.dart';
import './sign_uppage.dart';

import '../bottom_navigation_bar.dart';
import './after_login.dart';

class SignIn extends StatelessWidget {
  // const SignIn({Key? key}) : super(key: key);
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  Future<void> signin(BuildContext context) async {
    bool j = false;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text);
      print('signed in');

      j = true;
    } catch (e) {
      j = false;

      print(e);
    }
    if (j == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 400,
          ),
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                    validator: (input) {
                      if (input!.isEmpty) return 'Enter Email';
                    },
                    decoration: const InputDecoration(
                        labelText: 'Email', prefixIcon: Icon(Icons.email)),
                    onSaved: (input) =>
                        _email = input! as TextEditingController),
                TextFormField(
                    validator: (input) {
                      if (input!.length < 6) {
                        return 'Provide Minimum 6 Character';
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                    ),
                    obscureText: true,
                    onSaved: (input) =>
                        _password = input! as TextEditingController),
                const SizedBox(height: 20),
                ElevatedButton(
                  //padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed: () {
                    signin(context);
                  },
                  //color: Colors.orange,
                  //shape: RoundedRectangleBorder(
                  // borderRadius: BorderRadius.circular(20.0),

                  child: const Text('LOGIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
            child: const Text('Create an Account?'),
          )
        ],
      ),
    ));
  }
}

class HomePage extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
          padding: EdgeInsets.fromLTRB(80, 290, 20, 160),
          child: Text(
            'Signed In',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontStyle: FontStyle.italic),
          )),
    );
  }
}

class PomePage extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
          padding: EdgeInsets.fromLTRB(80, 290, 20, 160),
          child: Text(
            'Wrong Crendential',
            style: TextStyle(fontSize: 50),
          )),
    );
  }
}
