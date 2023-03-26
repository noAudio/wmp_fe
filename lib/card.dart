import 'dart:html';

/// Card UI element that is used to display a specific meal and
/// relevant prices.
///
/// ## Arguments
/// `String breakfast` holds the name of the breakfast item.
///
/// `String supper` holds the name of the supper item.
///
/// `int breakfastPrice` holds the price of `breakfast`.
///
/// `int supperPrice` holds the price of `supper`.
///
/// `DateTime date` holds the date assigned to the meal.
///
/// ## Methods
/// `int totalPrice()` outputs the price of breakfast and supper combined.
///
/// `bool isToday()` checks if the day the meal is assigned to
/// matches the current date.
///
/// `String whatDay()` converts `DateTime`'s value into it's string equivalent.
///
/// `ui()` returns the tree of HTML elements to be appended to the DOM.
class Card {
  String breakfast;
  String supper;
  int breakfastPrice;
  int supperPrice;
  DateTime date;

  Card({
    required this.breakfast,
    required this.supper,
    required this.breakfastPrice,
    required this.supperPrice,
    required this.date,
  });

  /// Gets total price of both breakfast and supper.
  int totalPrice() => breakfastPrice + supperPrice;

  /// Checks if the date passed into the constructor matches the current date.
  bool isToday() => date == DateTime.now();

  /// Method to convert `DateTime`'s `weekday`
  /// into a string representation.
  String whatDay(int weekday) {
    Map<int, String> weekName = {
      1: 'Monday',
      2: 'Tuesday',
      3: 'Wednesday',
      4: 'Thursday',
      5: 'Friday',
      6: 'Saturday',
      7: 'Sunday'
    };
    return weekName[weekday] ?? 'Invalid date.';
  }

  /// Builds out the UI for a card that shows the meal assigned for a specific day
  /// based on the class arguments.
  HtmlElement ui() => DivElement()
    ..classes
        .addAll(['flex-column', 'card', isToday() ? 'card-main' : 'card-minor'])
    ..children = [
      if (isToday())
        HeadingElement.h5()..innerText = '${date.day} ${whatDay(date.weekday)}',
      if (isToday())
        DivElement()
          ..classes.addAll(['flex-row', 'title'])
          ..children = [
            ParagraphElement()
              ..className = 'title-icon'
              ..innerText = '*',
            HeadingElement.h1()..innerText = 'Today',
          ],
      DivElement()
        ..classes.addAll(['flex-row', 'details'])
        ..children = [
          DivElement()
            ..className = 'chiclet'
            ..innerHtml = 'Breakfast \u00A0is',
          ParagraphElement()
            ..className = 'price'
            ..innerText = 'Ksh'
            ..children = [SpanElement()..innerText = breakfastPrice.toString()],
        ],
      DivElement()
        ..className = 'food'
        ..innerText = breakfast,
      DivElement()
        ..classes.addAll(['flex-row', 'details'])
        ..children = [
          DivElement()
            ..className = 'chiclet'
            ..innerHtml = 'Supper \u00A0is',
          ParagraphElement()
            ..className = 'price'
            ..innerText = 'Ksh'
            ..children = [
              SpanElement()..innerText = supperPrice.toString(),
            ],
        ],
      DivElement()
        ..className = 'food'
        ..innerText = supper,
      DivElement()
        ..className = 'price-total'
        ..innerHtml = 'Total: Ksh '
        ..children = [
          SpanElement()..innerText = totalPrice().toString(),
        ],
      if (!isToday())
        ParagraphElement()
          ..className = 'minor-headings'
          ..innerText = 'BREAKFAST',
      ParagraphElement()..innerText = breakfast,
      ParagraphElement()
        ..className = 'minor-headings'
        ..innerText = 'Supper',
      ParagraphElement()..innerText = supper,
      ParagraphElement()
        ..className = 'minor-price'
        ..innerText = 'Total: Ksh ${totalPrice().toString()}',
    ];
}
