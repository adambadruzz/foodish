import 'package:flutter/material.dart';
import 'package:foodishmobile/view/detail/detailFood.dart';
import 'package:foodishmobile/view/search/search.dart';

import '../../constant/constant.dart';
import '../../model/Foodish.dart';

import '../../model/User.dart';
import '../../navigator/drawer.dart';

import '../../viewmodel/foodish_service.dart';

class Home extends StatefulWidget {
  // final UserModel user;
  int user;
  Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  var lastIndex;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    TextEditingController controllerSearch = TextEditingController();

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 249, 0, 0),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Foodish',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins Bold',
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Search(
                              user: widget.user,
                            )));
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: DrawerWidget(
          user: widget.user,
        ),
        body: FutureBuilder<List<FoodishModel>>(
          future: FoodishService().fetchDataFood(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Container(
                  color: white,
                  child:
                      //
                      GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Detailfoodish(
                                              foodish: snapshot.data![index],
                                              user: widget.user,
                                              // studio: StudioModel(id: s,name: )
                                            )));
                              },
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      // height: 170,
                                      // width: 160,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "${snapshot.data![index].cover}"),
                                          )),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    snapshot.data![index].food_name,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: black),
                                  ),
                                ],
                              ),
                            );
                          }),
                );
              }
            }
          },
        ));
  }
}
