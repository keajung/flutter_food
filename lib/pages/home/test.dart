import 'package:flutter/material.dart';

void main() => runApp(const FlutterExample());

class FlutterExample extends StatelessWidget {
  const FlutterExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Example',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: const StateExample()
    );
  }
}

class StateExample extends StatefulWidget {
  const StateExample({Key? key}) : super(key: key);

  @override
  _StateExampleState createState() => _StateExampleState();
}

class _StateExampleState extends State<StateExample>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEFEFA),
      appBar: AppBar(
          title: const Text("Flutter - ListView item click listener")
      ),
      body: bodyContent(),
    );
  }

  bodyContent() {
    return ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text("${index + 1}"),
              onTap: () {
                SnackBar snackBar = SnackBar(
                    content: Text("Tapped : ${index + 1}")
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          );
        }
    );
  }
}