import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(appBar: AppBar(title: Text("Signup"),),body: Signup()),
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String firstname = "";
  String lastname = "";
  String emotivID = "";
  String email = "";
  String gender = "";
  String birthofdate = "";
  String password = "";
  String confirmpassword = "";

  InputDecoration inputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  Function IdValidator = (value) {
    String pattern =r'^[a-z0-9_/\-/\.]+$';
    RegExp regExp = RegExp(pattern);
    bool flag = regExp.hasMatch(value);
    if (!flag) {
      return 'only lowercase letters, numbers and the following characters . - _';
    }
    return null;
  };


  Function passwordValidator = (value,email) {
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-._]).{8,30}$';
    RegExp regExp = new RegExp(pattern);
    bool flagRegEx = regExp.hasMatch(value);
    bool flagLength = value.toString().length >= 8 ;
    print("$email");
    if (!flagRegEx && flagLength) {
      return 'only lowercase letters, numbers and the following characters . - _';
    }
    return null;
  };

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: inputDecoration.copyWith(labelText: "firstname"),
                  onChanged: (value) {
                    setState(() {
                      this.firstname = value;
                    });
                  },
                ),
                Divider(),
                TextFormField(
                  decoration: inputDecoration.copyWith(labelText: "lastname"),
                  onChanged: (value) {
                    setState(() {
                      this.lastname = value;
                    });
                  },
                ),
                Divider(),
                TextFormField(
                  decoration: inputDecoration.copyWith(labelText: "emotivID",helperText: "only lowercase letters, numbers and the following characters . - _"),
                  validator: IdValidator,
                  onChanged: (value) {
                    setState(() {
                      this.emotivID = value;
                    });
                  },
                ),
                Divider(),
                TextFormField(
                  decoration: inputDecoration.copyWith(labelText: "email"),
                  onChanged: (value) {
                    setState(() {
                      this.email = value;
                    });
                  },
                ),
                Divider(),
                TextFormField(
                  decoration: inputDecoration.copyWith(labelText: "gender"),
                  onChanged: (value) {
                    setState(() {
                      this.gender = value;
                    });
                  },
                ),
                Divider(),
                TextFormField(
                  decoration:
                  inputDecoration.copyWith(labelText: "birthofdate"),
                  onChanged: (value) {
                    setState(() {
                      this.birthofdate = value;
                    });
                  },
                ),
                Divider(),
                TextFormField(
                  decoration: inputDecoration.copyWith(labelText: "password"),
                  onChanged: (value) {
                    setState(() {
                      this.password = value;
                    });
                  },
                  validator: (value) {
                    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[-._]).{8,30}$';
                    RegExp regExp = new RegExp(pattern);
                    bool flagRegEx = regExp.hasMatch(value);
                    bool flagLength = value.toString().length >= 8 ;
                    bool flagEmail = value != email;
                    bool flagId = value != emotivID;
                    if(flagEmail && flagId){
                      if (!flagRegEx && flagLength) {
                        return 'only lowercase letters, numbers and the following characters . - _';
                      }
                    }
                    return null;
                  },
                ),
                Divider(),
                TextFormField(
                  decoration:
                  inputDecoration.copyWith(labelText: "confirmpassword"),
                  onChanged: (value) {
                    setState(() {
                      this.confirmpassword = value;
                    });
                  },
                  validator: (value){
                    if(value == password){
                      return null;
                    }
                    return "Passwords are not the same !";
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState.validate()) {
                      //TODO make your API call here
                      Scaffold.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
