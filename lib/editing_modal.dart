import 'dart:html';

class EditingModal {
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
              InputElement()
                ..type = 'search'
                ..name = 'search'
                ..id = 'search'
                ..placeholder = 'Search for specific food',
              DivElement()
                ..classes.addAll(['flex-column', 'food-list'])
                ..children = [
                  // TODO: Iterate over a list of foods returned from server
                  DivElement()
                    ..classes.addAll(['flex-row', 'food-item'])
                    ..children = [
                      ParagraphElement()..innerHtml = 'Mandazi &nbsp;',
                      Element.tag('i')
                        ..classes.addAll(['material-icons', 'md-12'])
                        ..innerText = 'delete',
                    ],
                ],
              DivElement()
                ..classes.addAll(['flex-row', 'add-new', 'pad-10px'])
                ..children = [
                  InputElement()
                    ..type = 'text'
                    ..name = 'food-name'
                    ..id = 'food-name'
                    ..placeholder = 'Food name',
                  SpanElement(),
                  InputElement()
                    ..type = 'number'
                    ..name = 'food-price'
                    ..id = 'food-price'
                    ..placeholder = 'Price',
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
                    ..innerText = 'Add',
                ],
            ],
        ]
    ];
}
