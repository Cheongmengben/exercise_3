import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DemoApp()));
}

class DemoApp extends StatelessWidget {
  // The build method rebuilds the widget tree if there are any changes.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Welcome Message'),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                new Container(
              child: new Image.asset('images/flutter.png'),
              alignment: Alignment.center,
            ),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child:TextField(
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name'
                    ),
                ),
                ),
                 Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child:TextField(
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email'
                    ),
                ),
                 ),
                 Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child:TextField(
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password'
                    ),
                ),
                 ),
                
                MyStatefulWidget(),
 
                SnackBarPage()
                
                
              ],
            ),
          )),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String? dropdownValue = null;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 2,
      elevation: 6,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Male', 'Female', 'Other', 'Rather not to say']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}


class SnackBarPage extends StatelessWidget {
  const SnackBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
                  final snackBar = SnackBar(
            content: const Text('You have signed up successfully'),
          );
          
          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Sign up'),
      ),
    );
  }
}


