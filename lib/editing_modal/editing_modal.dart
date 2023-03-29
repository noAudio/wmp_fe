import 'dart:html';

import 'package:wmp_fe/enums/food_type_enum.dart';
import 'package:wmp_fe/enums/input_mode_enum.dart';
import 'package:wmp_fe/models/food.dart';

import 'components/editing_input.dart';
import 'components/food_item.dart';

class EditingModal {
  // mock data
  List<Food> foods = [
    Food(name: 'Mandazi', price: 12, foodType: FoodType.breakfast),
    Food(name: 'Ugali', price: 34, foodType: FoodType.supper),
    Food(name: 'Bread and eggs', price: 56, foodType: FoodType.breakfast),
    Food(name: 'Chapati', price: 78, foodType: FoodType.supper),
    Food(name: 'Pancakes', price: 90, foodType: FoodType.breakfast),
  ];

  /// Filters the list of foods from the server based on the user input.
  void searchFood(Event event) {
    // TODO: Check if input value is in current list of foods.
    print((event.target as InputElement).value);
  }

  /// Creates a new `Food` based on user input.
  /// Inputs must pass the validator before being added to
  /// a `Food` object.
  void addFood(Event event) {
    var foodNameInput = querySelector('#food-name') as InputElement;
    var foodPriceInput = querySelector('#food-price') as InputElement;
    var foodTypeInput = querySelector('#food-type') as SelectElement;

    if (foodNameInput.value == '' ||
        foodNameInput.value == ' ' ||
        foodPriceInput.value == '') {
      // TODO: Create validator and check for empty space with regex
      if (foodNameInput.value == '' || foodNameInput.value == ' ') {
        foodNameInput.style.border = '2px solid red';
      }
      if (foodPriceInput.value == '') {
        foodPriceInput.style.border = '2px solid red';
      }
    } else {
      // TODO: Save new Food to store
      foodNameInput.style.border = '2px solid black';
      foodPriceInput.style.border = '2px solid black';
      var newFood = Food(
        name: foodNameInput.value as String,
        price: int.parse(foodPriceInput.value as String),
        foodType: foodTypeInput.value == 'breakfast'
            ? FoodType.breakfast
            : FoodType.supper,
      );
    }
  }

  /// Builds out the UI for a modal that shows editing options
  /// for the user.
  Element ui() => DivElement()
    ..className = 'modal'
    ..children = [
      DivElement()
        ..className = 'modal-content'
        ..children = [
          SpanElement()
            ..className = 'close'
            ..innerHtml = '&times;',
          HeadingElement.h2()..innerText = 'Edit Foods',
          DivElement()
            ..className = 'flex-column'
            ..children = [
              EditingInput(
                identifier: 'search',
                placeholder: 'Search for specific food',
                inputMode: InputMode.search,
              ).ui(),
              DivElement()
                ..classes.addAll(['flex-column', 'food-list'])
                ..children = [
                  // TODO: Iterate over a list of foods returned from server
                  for (Food food in foods) FoodItem(food: food).ui(),
                ],
              DivElement()
                ..classes.addAll(['flex-row', 'add-new', 'pad-10px'])
                ..children = [
                  EditingInput(
                    identifier: 'food-name',
                    placeholder: 'Food name',
                    inputMode: InputMode.text,
                  ).ui(),
                  SpanElement(),
                  EditingInput(
                    identifier: 'food-price',
                    placeholder: 'Price',
                    inputMode: InputMode.number,
                  ).ui(),
                  SpanElement(),
                  SelectElement()
                    ..name = 'food-type'
                    ..id = 'food-type'
                    ..children = [
                      OptionElement()
                        ..value = 'breakfast'
                        ..innerText = 'Breakfast',
                      OptionElement()
                        ..value = 'supper'
                        ..innerText = 'Supper',
                    ],
                  ButtonElement()
                    ..className = 'btn-util'
                    ..innerText = 'Add'
                    ..onClick.listen(addFood),
                ],
            ],
        ]
    ];
}
