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

  void _changeIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World - $selectedIndex'),
      ),
      bottomNavigationBar: AppBottomNav(
        changePage: _changeIndex,
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
