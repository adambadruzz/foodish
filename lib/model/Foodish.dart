class FoodishModel {
  final String cover, food_name, short_description, place, description;
  final int id_food;

  FoodishModel({
    required this.cover,
    required this.food_name,
    required this.id_food,
    required this.place,
    required this.short_description,
    required this.description,
  });

  factory FoodishModel.fromJSON(Map parsedJson) {
    return FoodishModel(
        cover: parsedJson['cover'],
        food_name: parsedJson['food_name'],
        id_food: parsedJson['id_food'],
        place: parsedJson['place'],
        short_description: parsedJson['short_description'],
        description: parsedJson['description']);
  }
}
