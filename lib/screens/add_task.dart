import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

List<String> images = [
  'https://www.theflavorbender.com/wp-content/uploads/2020/06/Chocolate-Cupcakes-SM-5629.jpg',
  'https://natashaskitchen.com/wp-content/uploads/2020/05/Vanilla-Cupcakes-3.jpg',
  'https://thescranline.com/wp-content/uploads/2021/03/Vanilla-Cupcakes.jpg',
  'https://www.tasteofhome.com/wp-content/uploads/2019/12/Oreo-Cupcakes-with-Cookies-and-Cream-Frosting_EXPS_FT19_247265_F_1203_1-5.jpg',
  'https://thescranline.com/wp-content/uploads/2021/03/Dancing-Queen-Cupcakes.jpg',
  'https://www.cookwithmanali.com/wp-content/uploads/2017/01/Eggless-Vanilla-Cupcakes-480x270.jpg'
];

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  TextEditingController title = TextEditingController();
  TextEditingController url = TextEditingController();
  TextEditingController desc = TextEditingController();
  String? status = 'Pending';
  final referenceDatabase = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: 160,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            width: double.infinity,
            color: Color.fromRGBO(108, 96, 224, 1),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Text('Cupcake',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        )),
                    Icon(
                      Icons.share_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: MediaQuery.of(context).size.height - 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(223, 220, 243, 1)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 10, right: 20, bottom: 20),
                      child: TextFormField(
                        controller: title,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(40)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Title',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Url',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 10, right: 20, bottom: 20),
                      child: TextFormField(
                        controller: url,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(40)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Url',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 10, right: 20, bottom: 20),
                      child: TextFormField(
                        maxLines: 3,
                        controller: desc,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(40)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Description',
                          hintStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Photos',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        height: 110,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(167, 160, 236, 1)),
                        child: Row(
                          children: [
                            TextButton(
                                style: ButtonStyle(
                                  fixedSize:
                                      MaterialStateProperty.all(Size(80, 80)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  side: MaterialStateProperty.all(BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(108, 96, 224, 1))),
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                ),
                                onPressed: () {},
                                child: Icon(
                                  Icons.add,
                                  color: Color.fromRGBO(108, 96, 224, 1),
                                  size: 30,
                                )),
                            Expanded(
                              child: ListView.builder(
                                  padding: EdgeInsets.all(10),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: (BuildContext, i) {
                                    return Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            height: 80,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: Image.network(images[i],
                                                height: 80,
                                                width: 80,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        )
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(6),
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(108, 96, 224, 1),
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.black,
                        iconEnabledColor: Colors.white,
                        value: status,
                        items: <String>['Pending', 'Completed']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: const TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                        onChanged: (a) {
                          setState(() {
                            status = a;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(160, 60)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                side: MaterialStateProperty.all(BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(108, 96, 224, 1))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    color: Color.fromRGBO(108, 96, 224, 1),
                                    fontSize: 14),
                              )),
                          TextButton(
                              style: ButtonStyle(
                                fixedSize:
                                    MaterialStateProperty.all(Size(160, 60)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                                side: MaterialStateProperty.all(
                                    BorderSide(width: 1, color: Colors.blue)),
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromRGBO(108, 96, 224, 1)),
                              ),
                              onPressed: () {
                                ref.child('task').push().set({
                                  "title": title.text.trim(),
                                  "url": url.text.trim(),
                                  "description": desc.text.trim(),
                                  "status": status,
                                  "image": ""
                                }).asStream();
                                Navigator.pop(context, true);
                              },
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              )),
                        ],
                      ),
                    ),
                    // TextButton(
                    //   onPressed: () {
                    //     ref.child('task').push().set({
                    //       "title": title.text.trim(),
                    //       "url": url.text.trim(),
                    //       "description": desc.text.trim(),
                    //       "status": status,
                    //       "image": ""
                    //     }).asStream();
                    //     Navigator.pop(context, true);
                    //   },
                    //   child: const Text('Save'),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
