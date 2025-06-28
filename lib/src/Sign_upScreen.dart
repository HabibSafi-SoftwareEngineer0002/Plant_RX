
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'Login_screen.dart';


class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  final _auth = FirebaseAuth.instance;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();


  String message = '';
  bool _isloading=false;

  Future<void> _signupUser() async {
    final _fullName=_nameController.text.trim();
    final _email=_emailController.text.trim();
    final _password=_passwordController.text.trim();
    final _confirmPass=_confirmpasswordController.text.trim();
    
    if(_email.isEmpty || _fullName.isEmpty ||_password.isEmpty ||_confirmPass.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please fill all fields")));
      return;
    }else if(_password!=_confirmPass){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("your password does not match ! Use matching Pass")));
    }

    _isloading=true;
    try {

      // Create user with email and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

      // Update user's display name

      await userCredential.user?.updateDisplayName(_nameController.text.trim());
      await userCredential.user?.reload();

      User? updateuser= FirebaseAuth.instance.currentUser;

      setState(() {

        message = "Signup successful! Welcome, ${updateuser?.displayName}";

      });
      setState(() {
        _isloading=false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );

      });
    } on FirebaseAuthException catch (e) {

      setState(() {
        _isloading=false;
        message = "Error: ${e.toString()}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(top: 15),child: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: Icon(Icons.arrow_back,size: 28,)),),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.only(left: 0.0, top: 10,right: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/leaf.png',
                width: 30,
                height: 55,

                color: Colors.green,
              ),
              const SizedBox(width: 5),
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
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Create your Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    //padding: const EdgeInsets.all(18.0),
                    padding: const EdgeInsets.fromLTRB(18.0, 15, 18, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full Name",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
        
                        TextField(
                           controller: _nameController,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_circle_outlined),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            hintText: 'Enter your Full name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    //padding: const EdgeInsets.all(18.0),
                    padding: const EdgeInsets.fromLTRB(18.0, 15, 18, 0),
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
                        SizedBox(height: 10),
        
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 15, 18, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                           controller: _passwordController,
                          cursorColor: Colors.green,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: 'Enter your Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18.0, 15, 18, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Confirm Password",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                           controller: _confirmpasswordController,
                          cursorColor: Colors.green,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: 'Enter confirm Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
        
                  //SizedBox(height: 10),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      _signupUser();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 150,
                        vertical: 16,
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?",style: TextStyle(fontSize: 15),),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.green,fontSize: 15),
                        ),
                      ),
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
