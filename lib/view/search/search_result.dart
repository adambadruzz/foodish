import 'package:flutter/material.dart';
import 'package:foodishmobile/view/detail/detailFood.dart';
import 'package:foodishmobile/view/search/search.dart';

import '../../constant/constant.dart';
import '../../model/Foodish.dart';

import '../../viewmodel/foodish_service.dart';

class SearchResult extends StatefulWidget {
  // final UserModel user;
  int user;
  String search;
  SearchResult({Key? key, required this.user, required this.search})
      : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: white,
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
        body: FutureBuilder<List<FoodishModel>>(
          future: FoodishService().readFoodSearch('${widget.search}'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Container(
                  color: white,
                  child: ListView.builder(
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
                              SizedBox(
                                height: 190,
                                width: 400,
                                child: Image.network(
                                  snapshot.data![index].cover,
                                  fit: BoxFit.fill,
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
                              SizedBox(
                                height: 10,
                              )
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
