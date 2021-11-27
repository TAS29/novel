import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThirdAppBar extends StatelessWidget {
  const ThirdAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(108, 96, 224, 1),
          borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 30),
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
                    Text('Cooking',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        )),
                    Icon(
                      FontAwesomeIcons.bell,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 48,),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                fillColor: const Color.fromRGBO(167, 160, 236, 1),
                filled: true,
                focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(167, 160, 236, 1)),
                      borderRadius: BorderRadius.circular(40)),
                enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(167, 160, 236, 1)),
                      borderRadius: BorderRadius.circular(40)),
                errorBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(167, 160, 236, 1)),
                      borderRadius: BorderRadius.circular(40)),
                disabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(167, 160, 236, 1)),
                      borderRadius: BorderRadius.circular(40)),
                border:
                    OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(167, 160, 236, 1)),
                      borderRadius: BorderRadius.circular(40)),
                hintText: 'what category are you searching for ?',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
