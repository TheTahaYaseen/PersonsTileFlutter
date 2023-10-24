import 'package:flutter/material.dart';
import 'package:person_tile/add_user_view.dart';
import 'package:person_tile/persons.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Persons List"),
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(persons[index].name),
            subtitle: Text(persons[index].email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddUserView()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
