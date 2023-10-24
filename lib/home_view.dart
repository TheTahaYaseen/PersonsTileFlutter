import 'package:flutter/material.dart';
import 'package:person_tile/add_user_view.dart';
import 'package:person_tile/persons.dart';
import 'package:person_tile/update_user_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(persons[index].name),
              subtitle: Text(persons[index].email),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        persons.remove(persons[index]);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete),
                      label: const Text("Delete")),
                  ElevatedButton.icon(
                      onPressed: () async {
                        final response = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateUserView(
                                    userName: persons[index].name,
                                    userEmail: persons[index].email)));
                        if (response != null) {
                          persons[index] = Person(
                              name: response["name"], email: response["email"]);
                          setState(() {});
                        }
                      },
                      icon: const Icon(Icons.update),
                      label: const Text("Update")),
                ],
              ));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final response = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddUserView()));
          if (response != null) {
            persons
                .add(Person(name: response["name"], email: response["email"]));
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
