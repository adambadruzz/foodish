import 'package:flutter/material.dart';

import 'package:foodishmobile/view/search/search_result.dart';

import '../../constant/constant.dart';

class Search extends StatefulWidget {
  // final UserModel user;
  int user;

  Search({Key? key, required this.user}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
            'Search',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontFamily: 'Poppins Bold',
              fontSize: 20,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 10),
              TextField(
                controller: controllerSearch,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Food...',
                  hintStyle: TextStyle(
                    fontFamily: 'Poppins Light',
                    color: lightGrey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: lightGrey),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchResult(
                                user: widget.user,
                                search: controllerSearch.text,
                              )));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                child: const Text("Search",
                    style: TextStyle(
                      fontFamily: 'Poppins SemiBold',
                      fontSize: 18,
                    )),
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}
