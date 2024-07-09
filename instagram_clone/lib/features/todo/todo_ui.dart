import 'package:flutter/material.dart';
import 'package:instagram_clone/features/todo/response_model.dart';
import 'package:instagram_clone/features/todo/todo_api.dart';

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TodoApi todoApi = TodoApi();
  Future<List<TodoResponseApi>>? myFutureCaller;
  @override
  void initState() {
    super.initState();
    myFutureCaller = todoApi.callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            myFutureCaller = todoApi.callApi();
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: FutureBuilder<List<TodoResponseApi>>(
          future: myFutureCaller,
          builder: (BuildContext context, AsyncSnapshot<List<TodoResponseApi>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Nothing to show'),
              );
            } else if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index].title ?? 'Title'),
                    leading: CircleAvatar(child: Text(snapshot.data![index].id.toString())),
                    trailing: snapshot.data![index].completed ?? false
                        ? const Icon(Icons.done_all, size: 15, color: Colors.green)
                        : const Icon(Icons.timer_sharp, size: 15, color: Colors.red),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(),
              );
            } else {
              return const Text('data');
            }
          }),
    );
  }
}
