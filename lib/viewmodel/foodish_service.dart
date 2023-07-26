import 'dart:ffi';

import 'package:dio/dio.dart';

import '../model/Foodish.dart';
import '../model/User.dart';

class FoodishService {
  final String Emu = "http://10.0.2.2:3000";
  final String baseUrlApi = "http://192.168.0.123:3000/api";

  Future<List<FoodishModel>> fetchDataFood() async {
    Response response = await Dio().get("$baseUrlApi/foodish/all");
    List<FoodishModel> food =
        (response.data as List).map((v) => FoodishModel.fromJSON(v)).toList();
    return food;
  }

  Future<List<FoodishModel>> readFoodPlace(String type) async {
    Response response = await Dio().get("$baseUrlApi/foodish/type/$type");
    List<FoodishModel> food =
        (response.data as List).map((v) => FoodishModel.fromJSON(v)).toList();
    return food;
  }

  Future<List<FoodishModel>> readFoodSearch(String search) async {
    Response response = await Dio().get("$baseUrlApi/foodish/search/$search");
    List<FoodishModel> food =
        (response.data as List).map((v) => FoodishModel.fromJSON(v)).toList();
    return food;
  }

  Future<List<UserModel>> fetchDataUser(int idUser) async {
    Response response = await Dio().get("$baseUrlApi/user/$idUser");
    List<UserModel> user =
        (response.data as List).map((v) => UserModel.fromJSON(v)).toList();
    return user;
  }
}
