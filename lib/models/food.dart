import 'dart:convert';

import 'package:wmp_fe/enums/food_type_enum.dart';

/// Model for a food item.
///
/// `String name` refers to the name of the food item.
///
/// `int price` refers to how much the food item costs.
///
/// `FoodType foodType` refers to the type of food, whether breakfast or supper.
class Food {
  String name;
  int price;
  FoodType foodType;
  Food({
    required this.name,
    required this.price,
    required this.foodType,
  });

  Food copyWith({
    String? name,
    int? price,
    FoodType? foodType,
  }) {
    return Food(
      name: name ?? this.name,
      price: price ?? this.price,
      foodType: foodType ?? this.foodType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'food_type': foodType == FoodType.breakfast ? 'breakfast' : 'supper',
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      foodType: map['food_type'] == 'breakfast'
          ? FoodType.breakfast
          : FoodType.supper,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));

  @override
  String toString() => 'Food(name: $name, price: $price, food_type: $foodType)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Food &&
        other.name == name &&
        other.price == price &&
        other.foodType == foodType;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
