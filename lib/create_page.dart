// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'repository.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final messagecontroller = TextEditingController();
  Repostiory respository = Repostiory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("create page"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          TextField(
            controller: firstnamecontroller,
            decoration: InputDecoration(hintText: "first name"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: lastnamecontroller,
            decoration: InputDecoration(hintText: "last name"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: messagecontroller,
            decoration: InputDecoration(hintText: "message "),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () async {
                bool response = await respository.createData(
                    firstnamecontroller.text,
                    lastnamecontroller.text,
                    messagecontroller.text);

                if (response) {
                  Navigator.popAndPushNamed(context, 'home');
                } else {
                  throw Exception('Failed to create data');
                }
              },
              child: Text("submit"))
        ]),
      ),
    );
  }
}
