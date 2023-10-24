// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:person_tile/home_view.dart';
import 'package:person_tile/persons.dart';

class AddUserView extends StatelessWidget {
  const AddUserView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameEditingController = TextEditingController();
    TextEditingController _emailEditingController = TextEditingController();

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
                  icon: const Icon(Icons.add),
                  label: const Text("Add"))
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
