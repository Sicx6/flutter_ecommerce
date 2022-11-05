import 'package:ecommerce_flutter/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../provider/users_provider.dart';

class DisplayName extends StatelessWidget {
  DisplayName({Key? key}) : super(key: key);

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.width * 0.04),
              Text(
                AppUser().user!.displayName ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.5),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.2),
              // TextField(
              //   decoration: InputDecoration(
              //     suffixIcon: const Icon(Icons.lock),
              //     hintText: 'User name',
              //     label: const Text('Current Display Name'),
              //     border: OutlineInputBorder(
              //       borderSide: const BorderSide(color: Colors.grey),
              //       borderRadius: BorderRadius.circular(25),
              //     ),
              //   ),
              // ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.06),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.lock),
                  hintText: 'New User name',
                  label: const Text('New Display Name'),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.3),
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
                  onPressed: () {
                    AppUser.instance.updateProfileName(nameController.text);
                  },
                  child: const Text(
                    'Update User Name',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
