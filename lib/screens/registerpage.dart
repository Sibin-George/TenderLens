import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tenderglass/screens/home_screen.dart';
import 'package:tenderglass/widgets/bottomnavbar.dart';

import '../widgets/constants.dart';
import 'package:tenderglass/widgets/constants.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool changeIconforpass = true;
  bool changeIconconfirm = true;
  bool isHover = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmPassController = TextEditingController();

  //sign user in method
  void signUserUp() async {
    final validate = _formKey.currentState!.validate();
    if (!validate) {
      return;
    } //show loading circle
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
    // creating the user
    try {
      // checking the password is confirmed
      if (_passwordController.text == _ConfirmPassController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text);

        // final _sharedPrefs = await SharedPreferences.getInstance();
        // await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>  MainScreen()));
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.grey.shade800,
            content: const Text(
              "Password don't match!",
            )));
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'Pleases enter a valid email',
        )));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email already in use')));
      } else if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Weak password')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
          child: Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, Color.fromARGB(255, 129, 72, 221)]),
              ),
              child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/fn.png'))),
                            ),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 0.0),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.27),
                                hintText: 'Email',
                                hintStyle: const TextStyle(color: Colors.white),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            kheight10,
                            Column(
                              children: [
                                TextFormField(
                                  controller: _passwordController,
                                  decoration: InputDecoration(
                                    suffixIcon: changeIconforpass
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                changeIconforpass =
                                                    !changeIconforpass;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.visibility_off,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                changeIconforpass =
                                                    !changeIconforpass;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.visibility,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.27),
                                    hintText: 'Password',
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  obscureText: changeIconforpass ? true : false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid password';
                                    }
                                    return null;
                                  },
                                ),
                                kheight10,
                                TextFormField(
                                  controller: _ConfirmPassController,
                                  decoration: InputDecoration(
                                    suffixIcon: changeIconconfirm
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                changeIconconfirm =
                                                    !changeIconconfirm;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.visibility_off,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                changeIconconfirm =
                                                    !changeIconconfirm;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.visibility,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.27),
                                    hintText: 'Confirm password',
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 10.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  obscureText: changeIconconfirm ? true : false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a valid password';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                            kheight30,
                            OutlinedButton(
                              onPressed: signUserUp,
                              // onPressed: (){},
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white)),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            kheight30,
                            Container(
                              decoration: const BoxDecoration(),
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 15),
                                  ),
                                  onPressed: () => {
                                        Navigator.of(context)
                                            .pushNamed('/login')
                                      },
                                  child: const Text(
                                    'Already a have an account? Login now',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
