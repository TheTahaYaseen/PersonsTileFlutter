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
                ),
              ),
              SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  controller: _emailEditingController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    persons.add(Person(
                        name: _nameEditingController.text,
                        email: _emailEditingController.text));
                    _nameEditingController.text = "";
                    _emailEditingController.text = "";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add"))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeView()));
          },
          child: const Icon(Icons.arrow_back),
        ));
  }
}
