import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final User? user = (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.toString());
      /*  userProvider.addUserData(
        currentUser: user,
        userEmail: user.email,
        userImage: user.photoURL,
        userName: user.displayName,
      );*/

      return user;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/background.png'))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 60.h,
            width: 80.w,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Sign in To Continue",
                      textScaler: TextScaler.noScaling,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                  Stack(
                    children: [
                      // Stroked text as border.
                      Text(
                        'Vagi',
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: 65,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 12
                            ..color = Colors.green.shade500,
                        ),
                      ),
                      // Solid text as fill.
                      Text(
                        'Vagi',
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(
                          fontSize: 65,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 8.h,
                        width: 80.w,
                        child: CupertinoButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                CupertinoIcons.timelapse,
                                color: Colors.black,
                              ),
                              Text(
                                'Sign In With Google',
                                textScaler: TextScaler.noScaling,
                                style: TextStyle(
                                  fontSize: 4.5.w,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          onPressed: () {
                            _googleSignUp();
                          },
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 8.h,
                        width: 80.w,
                        child: CupertinoButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                CupertinoIcons.ant_circle_fill,
                                color: Colors.black,
                              ),
                              Text(
                                'Sign In With Apple',
                                textScaler: TextScaler.noScaling,
                                style: TextStyle(
                                  fontSize: 4.5.w,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                          onPressed: () {},
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'By signing in you are agreeing to our',
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Terms and Privacy Policy',
                        textScaler: TextScaler.noScaling,
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
