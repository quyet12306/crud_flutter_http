import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

import 'repository.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final messagecontroller = TextEditingController();
  Repostiory respository = Repostiory();
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      firstnamecontroller.text = args[1];
    }
    if (args[2].isNotEmpty) {
      lastnamecontroller.text = args[2];
    }
    if (args[3].isNotEmpty) {
      messagecontroller.text = args[3];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("update page"),
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
                bool response = await respository.updatePage(
                    args[0],
                    firstnamecontroller.text,
                    lastnamecontroller.text,
                    messagecontroller.text);

                if (response) {
                  Navigator.popAndPushNamed(context, 'home');
                } else {
                  throw Exception('Failed to update data');
                }
              },
              child: Text("update"))
        ]),
      ),
    );
  }
}
