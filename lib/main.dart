import 'package:flutter/material.dart';
import 'repository.dart';
import 'persion.dart';
import 'create_page.dart';
import 'update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      routes: {
        'home': (context) => HomePage(),
        'create': (context) => CreatePage(),
        'update': (context) => UpdatePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repostiory repostiory = Repostiory();
  List<Persion> listPersion = [];

  getData() async {
    listPersion = await repostiory.getData();

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("http test")),
      body: ListView.builder(
          itemCount: listPersion.length,
          itemBuilder: (context, index) {
            Persion persion = listPersion[index];
            return InkWell(
              onTap: () {
                Navigator.popAndPushNamed(context, 'update', arguments: [
                  persion.id,
                  persion.firstname,
                  persion.lastname,
                  persion.message
                ]);
              },
              child: Dismissible(
                key: Key(persion.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Icon(Icons.delete),
                ),
                confirmDismiss: (direction) {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Delete Data"),
                        content: Text("Are you sure to delete this data ?"),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                bool response =
                                    await repostiory.deleteData(persion.id);
                                if (response) {
                                  Navigator.pop(context, true);
                                } else {
                                  Navigator.pop(context, false);
                                }
                              },
                              child: Text("yes")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text("no")),
                        ],
                      );
                    },
                  );
                },
                child: ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLacvTBSYzdQTb-pEGSMWAXJa9cPyZcXYGjg&usqp=CAU"),
                            fit: BoxFit.cover)),
                  ),
                  title: Text('${persion.firstname} ${persion.lastname}'),
                  subtitle: Text(
                    persion.message,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, 'create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
