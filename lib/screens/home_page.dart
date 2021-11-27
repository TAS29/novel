import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:novel/screens/add_task.dart';
import 'package:novel/screens/fav.dart';
import 'package:novel/utils/second_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final referenceDatabase = FirebaseDatabase.instance;
  late DatabaseReference ref;
  String? filter = "All";
  List taskData = [];
  List data = [];
  getData() async {
    Map jsonData = {};
    ref = referenceDatabase.reference();
    await ref.once().then((value) {
      jsonData = value.value["task"];
      taskData = jsonData.values.toList();
      data = jsonData.values.toList();
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            floatingActionButton: SizedBox(
              height: 65.0,
              width: 65.0,
              child: FittedBox(
                child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(108, 96, 224, 1),
                  onPressed: () async {
                    bool a = await Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const Task()));
                    if (a) {
                      getData();
                    }
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30,
                  ),
                  // elevation: 5.0,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            appBar: const PreferredSize(
              preferredSize: Size.fromHeight(200),
              child: SecondAppBar(),
            ),
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                color: Colors.black,
                height: 60,
                child: BottomNavigationBar(
                  iconSize: 40,
                  selectedItemColor: Color.fromRGBO(108, 96, 224, 1),
                  unselectedItemColor: Color.fromRGBO(167, 160, 236, 1),
                  selectedFontSize: 1,
                  unselectedFontSize: 1,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined), label: ''),
                    BottomNavigationBarItem(
                        icon: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => Fav()));
                            },
                            child: Icon(Icons.star_border)),
                        label: ''),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: [
                        const Text(
                          'Categories',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              FontAwesomeIcons.trashAlt,
                              color: Color.fromRGBO(167, 160, 236, 1),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(FontAwesomeIcons.edit,
                                color: Color.fromRGBO(167, 160, 236, 1))),
                        PopupMenuButton(
                            icon: Icon(FontAwesomeIcons.sort,
                                color: Color.fromRGBO(167, 160, 236, 1)),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Text("All"),
                                    value: 0,
                                    onTap: () {
                                      setState(() {
                                        taskData = data;
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: Text("Pending"),
                                    value: 1,
                                    onTap: () {
                                      setState(() {
                                        taskData = data
                                            .where(
                                                (i) => i['status'] == 'Pending')
                                            .toList();
                                        filter = "Pending";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    child: Text("Completed"),
                                    value: 2,
                                    onTap: () {
                                      setState(() {
                                        taskData = data
                                            .where((i) =>
                                                i['status'] == 'Completed')
                                            .toList();
                                        filter = "Completed";
                                      });
                                    },
                                  )
                                ])
                      ],
                    ),
                  ),
                  taskData.isNotEmpty
                      ? Expanded(
                          child: GridView.builder(
                              // shrinkWrap: true,
                              itemCount: taskData.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 40,
                                      crossAxisCount: 2),
                              itemBuilder: (BuildContext context, int index) {
                                return taskData != null? Container(
                                  decoration: BoxDecoration(
                                    color: index % 2 == 0
                                        ? Colors.amber[200]
                                        : Colors.blue[200],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            NetworkImage(images[index]),
                                      ),
                                      Text(
                                        taskData[index]["title"],
                                      ),
                                    ],
                                  ),
                                ):Center(child: Text('No Task Found'));
                              }),
                        )
                      : Center(child: Text('No Task Found'))
                ],
              ),
            ),
          ),
        ));
  }
}
