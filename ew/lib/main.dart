import 'package:flutter/material.dart';
import 'package:ew/login.dart';
import './sign_uppage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './after_login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late BuildContext context;

  navigateToLogin() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  navigateToSignIn() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMERGENCY APP',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Builder(builder: (context) {
        return Column(
          children: <Widget>[
            const SizedBox(height: 35.0),
            RichText(
                text: const TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'HEALH EMERGENCY APP',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange))
                ])),
            const SizedBox(height: 10.0),
            const Text(
              'GET NEAREST HOSPITAL SERVICES HERE',
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    //padding: EdgeInsets.only(left: 30, right: 30),
                    // onPressed: Navigator.push(context, Login_Page()),
                    //shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.circular(10.0),

                    onPressed: () {
                      //right way: use context in below level tree with MaterialApp
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
                SizedBox(width: 20.0),
                ElevatedButton(
                    //padding: EdgeInsets.only(left: 30, right: 30),
                    onPressed: () {
                      //right way: use context in below level tree with MaterialApp
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    // shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(10.0),

                    //color: Colors.orange,
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        );
      }),
    );
  }
}
