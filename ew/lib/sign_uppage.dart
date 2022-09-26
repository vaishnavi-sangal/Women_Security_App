import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ew/after_login.dart';
//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';

class SignUp extends StatelessWidget {
  late BuildContext context;

  navigateToLogin() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AfterLogin()),
    );
  }

  // const SignUp({Key? key}) : super(key: key);
  TextEditingController _email = new TextEditingController();

  TextEditingController _password = new TextEditingController();
  Future<void> signup(context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text);
    } catch (e) {
      print(e);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          body: SingleChildScrollView(
            //child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter Name';
                          },
                          decoration: InputDecoration(
                            labelText: 'Name',
                            prefixIcon: Icon(Icons.person),
                          ),
                          //   onSaved: (input) => _name = input!
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (input) {
                            if (input!.isEmpty) return 'Enter Email';
                          },
                          decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.email)),
                          //  onSaved: (input) => _email = input!),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (input) {
                            if (input!.length < 6)
                              return 'Provide Minimum 6 Character';
                          },

                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                          obscureText: true,
                          //   onSaved: (input) => _password = input!
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (input) {
                            if (input!.length < 10)
                              return 'Provide Minimum 10 Character';
                          },

                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: Icon(Icons.phone_callback),
                          ),
                          obscureText: true,
                          //   onSaved: (input) => _password = input!
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          //right way: use context in below level tree with MaterialApp
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AfterLogin()));
                        },
                        child: Text('sign up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyPage extends StatelessWidget {
  // const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
          padding: EdgeInsets.fromLTRB(80, 290, 20, 160),
          child: Text(
            'Signed Up',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontStyle: FontStyle.italic),
          )),
    );
  }
}
