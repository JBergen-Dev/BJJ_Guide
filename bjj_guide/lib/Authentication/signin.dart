import 'package:cloud_firestore/cloud_firestore.dart';
import '../Authentication/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../homePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignIn();
}

class _SignIn extends State<SignInPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  @override
  Widget build(BuildContext context) {
    double width = (screenWidth(context) < screenHeight(context) ? 0.95 : 0.5) *
        screenWidth(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: _loading
            ? const LoadingPage()
            : Container(
              decoration:const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/brazil_flag.jpg"),
            fit: BoxFit.cover,
          )),
              child:Center(
                child: SizedBox(
                    height: width,
                    width: width,
                    child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                const Text("Brazilian Jiu-Jitsu Guide"),
                                TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Email'),
                                    controller: _email,
                                    validator: (String? text) {
                                      if (text == null || text.isEmpty) {
                                        return "Must Enter Email";
                                      } else if (!text.contains('@')) {
                                        return "email is formatted incorrectly";
                                      }
                                      return null;
                                    }),
                                TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                        labelText: 'Password'),
                                    controller: _password,
                                    validator: (String? text) {
                                      if (text == null || text.length < 6) {
                                        return "Password must be at least 6 characters";
                                      }
                                      return null;
                                    }),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _loading = true;
                                      logIn(context);
                                      _loading = false;
                                    });
                                  },
                                  child: const Text("Log In"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const RegistrationPage()));
                                  },
                                  child: const Text("Register"),
                                ),
                              ],
                            ),
                          ),
                        ))))));
  }

  void logIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
            email: _email.text, password: _password.text);
        FirebaseAuth.instance.userChanges().listen((User? user) {
          if (user != null) {
            Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => const MyHomePage()),
      ModalRoute.withName('/'));
          } else {
            _loading = false;
          }
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == "wrong-password" || e.code == "no_email") {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Incorrect email/password")));
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
