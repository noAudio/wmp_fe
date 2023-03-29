import 'dart:html';

import 'package:wmp_fe/enums/input_mode_enum.dart';
import 'package:wmp_fe/mock_data.dart';
import 'package:wmp_fe/models/food.dart';
import 'package:wmp_fe/ui/editing_modal/components/food_item.dart';

class EditingInput {
  String identifier;
  String placeholder;
  InputMode inputMode;

  EditingInput({
    required this.identifier,
    required this.placeholder,
    required this.inputMode,
  });

  /// Filters the list of foods from the server based on the user input.
  void searchFood(Event event) {
    // TODO: Change this to alter the store for ui to be rebuilt elsewhere.
    var foodList = querySelector('.food-list') as DivElement;
    var userInput = (event.target as InputElement).value as String;
    var matchingFoods = <Food>[];
    bool isFiltered = false;

    if (userInput != '' && userInput != ' ') {
      bool matchesFound = false;
      isFiltered = true;
      for (var food in mockFoods) {
        if (food.name.toLowerCase().contains(userInput.toLowerCase())) {
          matchingFoods.add(food);
          matchesFound = true;
        }
      }
      if (!matchesFound) {
        foodList.children.clear();
        foodList.children
            .add(ParagraphElement()..innerText = 'No matches found');
      }
    }

    if (matchingFoods.isNotEmpty) {
      foodList.children.clear();
      foodList.children
          .addAll([for (var food in matchingFoods) FoodItem(food: food).ui()]);
    } else {
      foodList.children.clear();
      if (isFiltered) {
        foodList.children
            .add(ParagraphElement()..innerText = 'No matches found');
      } else {
        foodList.children
            .addAll([for (var food in mockFoods) FoodItem(food: food).ui()]);
      }
    }
  }

  /// Builds the input elements based on input mode.
  InputElement ui() => InputElement()
    ..type = inputMode == InputMode.search
        ? 'search'
        : inputMode == InputMode.text
            ? 'text'
            : 'number'
    ..name = identifier
    ..id = identifier
    ..placeholder = placeholder
    ..onChange.listen(inputMode == InputMode.search ? searchFood : null);
}
