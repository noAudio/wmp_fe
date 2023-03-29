import 'dart:html';

import 'package:wmp_fe/enums/food_type_enum.dart';
import 'package:wmp_fe/models/food.dart';

class AddButton {
  late InputElement foodNameInput;
  late InputElement foodPriceInput;
  late SelectElement foodTypeInput;

  /// Link required ui elements.
  void linkElements() {
    foodNameInput = querySelector('#food-name') as InputElement;
    foodPriceInput = querySelector('#food-price') as InputElement;
    foodTypeInput = querySelector('#food-type') as SelectElement;
  }

  /// Creates a new `Food` based on user input.
  /// Inputs must pass the validator before being added to
  /// a `Food` object.
  void addFood(Event event) {
    linkElements();
    if (foodNameInput.value == '' ||
        foodNameInput.value == ' ' ||
        foodPriceInput.value == '') {
      // TODO: Create validator and check for empty space with regex
      if (foodNameInput.value == '' || foodNameInput.value == ' ') {
        foodNameInput.classes.add('error-border');
      }
      if (foodPriceInput.value == '') {
        foodPriceInput.classes.add('error-border');
      }
    } else {
      // TODO: Save new Food to store
      foodNameInput.classes.remove('error-border');
      foodPriceInput.classes.remove('error-border');
      var newFood = Food(
        name: foodNameInput.value as String,
        price: int.parse(foodPriceInput.value as String),
        foodType: foodTypeInput.value == 'breakfast'
            ? FoodType.breakfast
            : FoodType.supper,
      );
    }
  }

  ButtonElement ui() => ButtonElement()
    ..className = 'btn-util'
    ..innerText = 'Add'
    ..onClick.listen(addFood);
}
