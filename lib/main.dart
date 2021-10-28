import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DemoApp()));
}
class DemoApp extends StatefulWidget{
  DemoApp({Key? key}) : super(key: key);
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  // The build method rebuilds the widget tree if there are any changes.
  void initState() {
    super.initState();
  }
  
  bool checkNull = false;
  bool _btnEnabled = false;

  _doSomething () {
    ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(
                        content: Text(
                          'You have signed up successfully.',
                          style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                          )
                        ),
                    );
  }

  var currentSelectedValue;
  static const genderTypes = ["Male", "Female", "Other", "Rather not to say"];

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
          appBar: AppBar(
            title: Text('Welcome Message'),
          ),
          body: Form(
              key: formKey,
              onChanged: () => setState(() => _btnEnabled = formKey.currentState!.validate()),
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  child: Image.asset('images/flutter.png'),
                  alignment: Alignment.center,
                ),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                 child: TextFormField(  
                  validator: (String? value) {
                  if(value == null || value.isEmpty){
                    return "Name cannot be empty";
                  }
                  return null;
                  }, 
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    hintText: 'Name'
                    ),
                ),
                ),
            
                
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child:TextFormField(
                   validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Email cannot be empty";
                  }else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value)) {
                      return 'Valid email required';
                }
                  return null;
                },
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email'
                    ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child:TextFormField(
                  validator: (value) {
                  if(value == null || value.isEmpty){
                    return "Password cannot be empty";
                  }
                  return null;
                }, 
                    decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password'
                    ),
                ),
              ),
                
              Container(
                padding: EdgeInsets.all(18),
                width: 600,
                child: DropdownButtonFormField<String>(
                  validator: (value) => value == null ? 'Please select your gender' : null,
                  isExpanded: true,
                  hint: Text("Select your gender"),
                  value: currentSelectedValue,
                  icon: Icon(Icons.keyboard_arrow_down_rounded),
                  items: genderTypes.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    currentSelectedValue = newValue;
                  });
                },
              ),
            ),
                 ElevatedButton(
                   onPressed: _btnEnabled? () => _doSomething(): null,
                   child: Text('Sign up')
                 ),        
              ],
            ),
          )),
      ),
    );
  }
}
