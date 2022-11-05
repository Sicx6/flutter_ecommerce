import 'package:ecommerce_flutter/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register Account',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Sign in with your email and password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 150,
              ),
              Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.person),
                      hintText: 'Enter your name',
                      label: Text('Name'),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextField(
                  //   controller: nameController,
                  //   decoration: InputDecoration(
                  //     suffixIcon: const Icon(Icons.person),
                  //     hintText: 'Enter your Phone Number',
                  //     label: Text('Phone number'),
                  //     border: OutlineInputBorder(
                  //       borderSide: const BorderSide(color: Colors.grey),
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.email),
                      hintText: 'Enter your email',
                      label: Text('Email'),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.lock),
                      hintText: 'Enter your password',
                      label: const Text('password'),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.lock),
                      hintText: 'Re-Enter your password',
                      label: const Text('Confirm password'),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(color: Colors.amber),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (confirmPasswordController.text.isEmpty ||
                        confirmPasswordController.text !=
                            passwordController.text) {
                      print('confirm password doesn not match');
                    }
                    try {
                      AppUser.instance.signUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  'email ${emailController.text} has succesfully register'),
                            );
                          });
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(e.toString()),
                            );
                          });
                    }
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'By continuing, you area confirming that you agree\n with our Terms and Conditions',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
