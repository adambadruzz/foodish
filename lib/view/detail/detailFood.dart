import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:restart_app/restart_app.dart';
import '../../constant/constant.dart';
import '../../model/Foodish.dart';
import '../../model/User.dart';

import '../../viewmodel/foodish_service.dart';
import '../profile/profile.dart';

class Detailfoodish extends StatefulWidget {
  final FoodishModel foodish;
  int user;

  Detailfoodish({Key? key, required this.foodish, required this.user})
      : super(key: key);

  @override
  State<Detailfoodish> createState() => _DetailfoodishState();
}

class _DetailfoodishState extends State<Detailfoodish> {
  Dio dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 0, 0),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text("${widget.foodish.food_name}",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "${widget.foodish.short_description}",
                        style:
                            TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Asal : ${widget.foodish.place}",
                        style:
                            TextStyle(color: Color.fromARGB(255, 49, 49, 49)),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 365,
                        height: 470,
                        child: Image.network(
                          widget.foodish.cover,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(
                "${widget.foodish.description}",
                style: Theme.of(context).textTheme.bodyText2,
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        )));
  }
}

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   child: Icon(Icons.favorite, color: favIconcolor),
      //   onPressed: () {
      //     setState(() {
      //       if (favIconcolor == Colors.grey) {
      //         favIconcolor = Colors.red.shade700;
      //       } else {
      //         favIconcolor = Colors.grey;
      //       }
      //     });
      //   },
      // ),

