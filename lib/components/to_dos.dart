import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/utils/user_models.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<ToDos>? todos;

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = json.decode(response.body);
      setState(() {
        todos = jsonList.map((json) => ToDos.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load todos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: todos != null
          ? ListView.builder(
              itemCount: todos?.length,
              itemBuilder: (context, index) {
                final todo = todos![index];
                return ListTile(
                  title: Text('${index+1}, ${todo.title}'),
                  trailing: todo.completed
                      ? Icon(Icons.check_circle, color: Colors.green)
                      : Icon(Icons.radio_button_unchecked, color: Colors.grey),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
