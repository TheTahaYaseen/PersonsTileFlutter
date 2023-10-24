// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class UpdateUserView extends StatelessWidget {
  final String userName;
  final String userEmail;

  const UpdateUserView(
      {super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameEditingController = TextEditingController();
    TextEditingController _emailEditingController = TextEditingController();

    _nameEditingController.text = userName;
    _emailEditingController.text = userEmail;

    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  controller: _nameEditingController,
                  decoration: const InputDecoration(hintText: "Name"),
                ),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  controller: _emailEditingController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    String name = _nameEditingController.text.toString();
                    String email = _emailEditingController.text.toString();

                    if (name.isNotEmpty && email.isNotEmpty) {
                      Navigator.pop(context, {"name": name, "email": email});
                    }
                  },
                  icon: const Icon(Icons.update),
                  label: const Text("Update"))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ));
  }
}
