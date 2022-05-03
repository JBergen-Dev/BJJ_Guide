import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bjj_guide/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<RegistrationPage> {
  final _display = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  String dropdownValue = "White";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text("Registration")),
        body: _loading
            ? const LoadingPage()
            : Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              labelText: 'Display Name'),
                          controller: _display,
                          validator: (String? text) {
                            if (text == null || text.isEmpty) {
                              return "Must enter a display name";
                            }
                            return null;
                          }),
                      TextFormField(
                          decoration: const InputDecoration(labelText: 'Email'),
                          controller: _email,
                          validator: (String? text) {
                            if (text == null || text.isEmpty) {
                              return "Must Enter Email";
                            } else if (!text.contains('@')) {
                              return "your email is formatted incorrectly";
                            }
                            return null;
                          }),  
                      TextFormField(
                          obscureText: true,
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          controller: _password,
                          validator: (String? text) {
                            if (text == null || text.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          }),
                      TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: 'Re-enter password'),
                          validator: (String? text) {
                            if (text == null || text.length < 6) {
                              return "Password must be at least 6 characters";
                            } else if (text != _password.text) {
                              return "Your passwords do not match";
                            }
                            return null;
                          }),
                      Container(height: 20),

                      Text("Select your belt level", 
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      )),
                      DropdownButton<String>(
                        alignment: const Alignment(-1.0,0.0),
                        hint: const Text("Please select your belt level"),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style:  TextStyle(color: Colors.grey[600]),
                        underline: Container(
                          height: 2,
                          color: Colors.grey[600],
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['White', 'Blue', 'Purple', 'Brown', "Black"]
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),      
                      Container(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _loading = true;
                            register(context);
                          });
                        },
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ),
              ));
  }
  void register(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth.createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == "wrong-password" || e.code == "no_email") {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Incorrect email/password")));
        }
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      }
      try {
        if (_auth.currentUser != null) {
          await _db.collection("users").doc(_auth.currentUser!.uid).set({
            "name": _display.text,
            "belt": dropdownValue,
            "email": _email.text,
            "created": DateTime.now()
          });
          Navigator.of(context).pop();
        }
      } on FirebaseException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message ?? "Unknown Error")));
      }
    }
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}