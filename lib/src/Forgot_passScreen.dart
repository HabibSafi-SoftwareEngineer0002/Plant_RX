
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login_screen.dart';


class ForgotPassscreen extends StatefulWidget {
  const ForgotPassscreen({super.key});

  @override
  State<ForgotPassscreen> createState() => _ForgotPassscreenState();
}

class _ForgotPassscreenState extends State<ForgotPassscreen> {
  final _emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  String message = '';
  Future<void> _sendResetEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text("Email Sent"),
              content: Text(
                "A password reset link has been sent to your email. Please check your Gmail for reseting pass After resetting, return to this app and login with the new password.",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => LoginScreen()),
                    );
                  },
                  child: Text("OK"),
                ),
              ],
            ),
      );
      // setState(() {
      //   message = "✅ Reset link sent! Check your email.";
      // });
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${e.toString()}")));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(top: 23),child: IconButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
            icon: Icon(Icons.arrow_back,size: 28,)),),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(left: 0.0, top: 25,right: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/leaf.png',
                width: 35,
                height: 55,

                color: Colors.green,
              ),
              const SizedBox(width: 8),
              const Text(
                'PlantID',
                style: TextStyle(
                  fontSize: 25,
                  // fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 48.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Reset Your password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 35),
                  Text(
                    "Enter your email address to reset ",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 0,),
                  Text("Your password",textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
                  const SizedBox(height: 30),
                  Padding(
                    //padding: const EdgeInsets.all(18.0),
                    padding: const EdgeInsets.fromLTRB(18.0, 20, 18, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 14),
          
                        TextField(
                           controller: _emailController,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            hintText: 'Enter your Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          
                  //const SizedBox(height: 5),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(18.0, 08, 18, 0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         "Email",
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           color: Colors.black,
                  //           fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //       SizedBox(height: 10),
                  //       TextField(
                  //         cursorColor: Colors.green,
                  //         obscureText: true,
                  //         decoration: InputDecoration(
                  //           prefixIcon: Icon(Icons.lock_outline),
                  //           hintText: 'Enter your Email',
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(8),
                  //           ),
                  //           focusedBorder: OutlineInputBorder(
                  //             borderSide: BorderSide(color: Colors.green),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
          
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 0, 05, 0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       TextButton(
                  //         onPressed: () {
                  //           Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassscreen()));
                  //         },
                  //         child: Text(
                  //           "Forgot Password?",
                  //           style: TextStyle(color: Colors.green),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    onPressed: () {
                      _sendResetEmail();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 150,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Text("Don't have any account ?"),
                      // TextButton(
                      //   onPressed: () {
                      //
                      //   },
                      //   child: Text(
                      //     "Back to Login",
                      //     style: TextStyle(color: Colors.green,fontSize: 15),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
