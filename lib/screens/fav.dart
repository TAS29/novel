import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:novel/screens/add_task.dart';
import 'package:novel/screens/third_app_bar.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  List<String> text = ['All', 'Cake', 'Fast Food', 'Kabab'];
  List<String> cake = ['Vanilla Cake', 'Cupcake', 'Pan Cake', 'Donut'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(180), child: ThirdAppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Labels',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext, i) {
                    return Row(
                      children: [
                        i == 0
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                    height: 45,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              Color.fromRGBO(108, 96, 224, 1)),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                        child: Icon(
                                      Icons.add,
                                      color: Color.fromRGBO(108, 96, 224, 1),
                                    ))),
                              )
                            : i == 2
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        height: 45,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(108, 96, 224, 1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                            child: Text(
                                          text[i],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ))),
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Container(
                                        height: 45,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(167, 160, 236, 1),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                            child: Text(
                                          text[i],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ))),
                                  ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Bookmarks',
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
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.sort,
                              color: Color.fromRGBO(167, 160, 236, 1))),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.bookmark,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '154',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: 4,
                  itemBuilder: (BuildContext, i) {
                    return Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(167, 160, 236, 1),
                                  blurRadius: 1,
                                  offset: Offset(0, 5),
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Row(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        images[i],
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      )),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        cake[i],
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                FontAwesomeIcons.solidBell,
                                                color: i==2?Colors.orange :Color.fromRGBO(
                                                    167, 160, 236, 1),
                                              )),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.star,size: 30,
                                                color: i==1?Colors.orange:i==2?Colors.orange: Color.fromRGBO(
                                                    167, 160, 236, 1),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.door_front_door,
                                                color: Colors.orange
                                              )),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
