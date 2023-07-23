import 'package:flutter/material.dart';
import 'package:http/screens/SecondPage.dart';
import '../functions/CustomeSearchDelegate.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  firstPage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  dialogBox() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'ADD',
            style: TextStyle(fontSize: 30),
          ),
          content: Padding(
            padding: const EdgeInsets.all(5),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.black),
                borderRadius: BorderRadius.circular(5),
              )),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  addList();
                },
                child: const Text('Add')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  addList() {
    searchList.add(_controller.text);
    _controller.clear();
    Navigator.pop(context);
  }

  _drawerHeader() {
    return DrawerHeader(
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.deepPurple.shade100.withOpacity(0.4)),
        child: const Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.deepPurpleAccent,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ROHIT RAI',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'rbahingrai143@gmail.com',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: const Icon(Icons.search),
              )
            ],
            elevation: 2,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.work),
              )
            ]),
          ),
          body: TabBarView(
            children: [
              firstPage(),
              const SecondPage(),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                onPressed: dialogBox,
                tooltip: 'add',
                backgroundColor: Colors.red[300],
                child: const Icon(Icons.add),
              ),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.deepPurple.shade300,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(1),
              child: Column(children: [
                _drawerHeader(),
              ]),
            ),
          )),
    );
  }
}
