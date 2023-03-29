import 'dart:html';

import 'package:wmp_fe/enums/input_mode_enum.dart';
import 'package:wmp_fe/mock_data.dart';
import 'package:wmp_fe/models/food.dart';

import 'components/add_button.dart';
import 'components/editing_input.dart';
import 'components/food_item.dart';

/// A UI modal that allows the user to edit foods in the database.
/// All foods are listed and can be filtered using the search input.
/// User actions include filtering, deletion and addition.
class EditingModal {
  // mock data
  List<Food> foods = mockFoods;

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
                  AddButton().ui(),
                ],
            ],
        ]
    ];
}
