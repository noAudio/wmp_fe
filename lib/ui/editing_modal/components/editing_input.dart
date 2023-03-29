import 'dart:html';

import 'package:wmp_fe/enums/input_mode_enum.dart';

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
    // TODO: Check if input value is in current list of foods.
    print((event.target as InputElement).value);
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
