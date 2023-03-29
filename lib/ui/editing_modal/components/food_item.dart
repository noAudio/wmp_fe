import 'dart:html';

import 'package:wmp_fe/models/food.dart';

class FoodItem {
  Food food;
  Element deleteButton = Element.tag('i')
    ..classes.addAll(['material-icons', 'md-12'])
    ..innerText = 'delete';

  FoodItem({
    required this.food,
  });

  /// Builds the UI for the `FoodItem`.
  Element ui() => DivElement()
    ..classes.addAll(['flex-row', 'food-item'])
    ..onMouseEnter
        .listen((event) => (event.target as Element).append(deleteButton))
    ..onMouseLeave.listen((event) => (deleteButton.remove()))
    ..children = [
      ParagraphElement()..innerHtml = '${food.name}, Kes ${food.price} &nbsp;',
    ];
}
