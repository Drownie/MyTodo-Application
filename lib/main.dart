import 'package:flutter/material.dart';

void main() {
  runApp(const MyTodo());
}

class MyTodo extends StatelessWidget {
  const MyTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTodo',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({
    super.key,
  });

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  var selectedIndex = 0;

  List<String> tasksName = <String>[
    "Task 1",
    "Task 2",
    "Task 3",
  ];

  void _changeIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppContainer(selectedIndex: selectedIndex, tasksName: tasksName),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        tooltip: 'Add new task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: AppBottomNav(
        changePage: _changeIndex,
      ),
    );
  }
}

class AppContainer extends StatelessWidget {
  const AppContainer(
      {super.key, required this.selectedIndex, required this.tasksName});

  final int selectedIndex;
  final List<String> tasksName;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: .8),
        children: tasksName.map((String taskName) {
          return TaskItem(taskName: taskName);
        }).toList(),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.taskName,
  });

  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.background,
        ),
        child: ListTile(
          textColor: Theme.of(context).colorScheme.onBackground,
          leading: Checkbox(
            checkColor: Theme.of(context).colorScheme.secondary,
            activeColor: Theme.of(context).colorScheme.onSecondary,
            value: false,
            onChanged: (value) {},
          ),
          title: Text(taskName),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.redAccent,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key, required this.changePage});

  final void Function(int newIndex) changePage;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      selectedItemColor: Colors.white70,
      unselectedItemColor: Colors.white,
      onTap: (value) => changePage(value),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All Task'),
        BottomNavigationBarItem(icon: Icon(Icons.checklist), label: 'Task Done')
      ],
    );
  }
}
