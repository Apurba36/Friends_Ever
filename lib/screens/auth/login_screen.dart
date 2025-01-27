import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:friends_ever/api/apis.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../helper/dialogs.dart';
import '../../main.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAnimate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _isAnimate = true);
    });
  }

  _handleGoogleBtnClick() {
    //for showing progress bar
    Dialogs.showProgressBar(context);
    _signInWithGoogle().then((user) async {
      //for hiding progress bar
      Navigator.pop(context);
      if (user != null) {
        log('\nUser : ${user.user}');
        log('\nUserAdditionaInfo: ${user.additionalUserInfo}');

        if (await APIs.userExists()) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const HomeScreen()));
        } else {
          await APIs.createUser().then((value) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomeScreen()));
          });
        }
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      log('\n_signInWithGoogle: $e');
      Dialogs.showSnackbar(context, 'Something Went Wrong (Check Internet)');
      return null;
    }
  }
  //sign out function
  // _signOut() async {
  // await firebaseAuth.instance.signOut();
  //await GoogleSignIn().signOut();
  // }

  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return Scaffold(
        //app bar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Welcome to Friends Ever',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        //floating button to add new user
        body: Stack(
          children: [
            AnimatedPositioned(
                top: mq.height * .15,
                right: _isAnimate ? mq.width * .25 : -mq.width * .5,
                width: mq.width * .5,
                duration: const Duration(seconds: 1),
                child: Image.asset('images/icon.png')),
            Positioned(
                bottom: mq.height * .15,
                left: mq.width * .05,
                width: mq.width * .9,
                height: mq.height * .07,
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 223, 255, 187),
                        shape: StadiumBorder(),
                        elevation: 1),
                    onPressed: () {
                      _handleGoogleBtnClick();
                    },
                    icon: Image.asset('images/google.png',
                        height: mq.height * .03),
                    label: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 17),
                          children: [
                            TextSpan(text: 'Login with '),
                            TextSpan(
                                text: 'Google',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                          ]),
                    ))),
          ],
        ));
  }
}
