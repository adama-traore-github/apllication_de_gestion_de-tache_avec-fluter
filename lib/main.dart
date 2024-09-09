

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class Task {
  String name;
  bool done;

  Task({required this.name, this.done = false});
}

class _MyWidgetState extends State<MyWidget> {
  TextEditingController _controller = TextEditingController();
  List<Task> _tasks = [
    Task(name: "Faire les courses"),
    Task(name: "Appeler le médecin"),
    Task(name: "Préparer le rapport"),
  ];

  void ajout() {
    setState(() {
      String newTask = _controller.text.trim();
      if (newTask.isNotEmpty) {
        _tasks.add(Task(name: newTask));
        _controller.clear(); // Efface le champ de texte après l'ajout
      }
    });
  }

  void removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      icon: Icon(Icons.task, size: 55),
                      hintText: "ajoutez une tâche",
                      labelText: "tâche",
                    ),
                    onSubmitted: (String value){
                      ajout();
                    },
                  ),
                ),
                TextButton.icon(
                  onPressed: ajout,
                  icon: Icon(Icons.add_task, size: 55),
                  label: Text("ajouter"),
                ),
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(_tasks[index].name),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      removeTask(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("${_tasks[index].name} supprimée")),
                      );
                    },
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        _tasks[index].name,
                        style: TextStyle(fontSize: 25, color: Colors.red),
                      ),
                      value: _tasks[index].done,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _tasks[index].done = newValue ?? false;
                        });
                      },
                      controlAffinity: ListTileControlAffinity.trailing,
                      secondary: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              removeTask(index);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${_tasks[index].name} supprimée")),
                              );
                            },
                          ),
                          Icon(
                            Icons.task,
                            color: _tasks[index].done ? Colors.blue : null, // Change la couleur si done est vrai
                          ),
                        ],
                      ),
                      activeColor: Colors.blue, // Couleur quand la case à cocher est sélectionnée
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}