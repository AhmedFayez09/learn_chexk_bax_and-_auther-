// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:checkbox_radiobutton/details.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> KeyForm = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool? Done = false;

  String? groupName = null;
  String male = 'male';
  String female = 'female';
  String auther = 'auther';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Form(
        key: KeyForm,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                        text: 'SCIN',
                        style: TextStyle(
                            color: Color.fromARGB(135, 40, 223, 16),
                            fontSize: 30)),
                    TextSpan(
                        text: 'UP',
                        style: TextStyle(
                            color: Color.fromARGB(255, 131, 177, 135),
                            fontSize: 30)),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              TextFormField(
                validator: (val) {
                  bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(emailController.text);
                  if (val!.isEmpty) {
                    return 'Please Enter the email';
                  } else if (!emailValid) {
                    return 'enter valid email';
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  label: const Text("Email"),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'please enter password';
                  } else if (val.length < 2) {
                    return 'please enter more 2 char';
                  }
                },
                controller: passwordController,
                decoration: InputDecoration(
                  label: const Text("Password"),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 244, 54, 177)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Row(
                children: [
                  Checkbox(
                      value: Done,
                      onChanged: (val) {
                        setState(() {
                          Done = val;
                        });
                      }),
                  const SizedBox(width: 15),
                  const Text('i accept term & conditions'),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  const Text('male'),
                  Radio(
                      value: male,
                      groupValue: groupName,
                      onChanged: (val) {
                        setState(() {
                          groupName = val!;
                        });
                      }),
                  const SizedBox(width: 40),
                  const Text('Female'),
                  Radio(
                      value: female,
                      groupValue: groupName,
                      onChanged: (val) {
                        setState(() {
                          groupName = val!;
                        });
                      }),
                  const SizedBox(width: 40),
                  const Text('auther'),
                  Radio(
                      value: auther,
                      groupValue: groupName,
                      onChanged: (val) {
                        setState(() {
                          groupName = val!;
                        });
                      }),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30))),
                onPressed: () {
                  if (KeyForm.currentState!.validate()) {
                    if (Done == true) {
                      if (groupName != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => DetailsScreen(group: groupName!),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please Check Radio Buttom'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please Check the Check Box'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                child: const Text("login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
