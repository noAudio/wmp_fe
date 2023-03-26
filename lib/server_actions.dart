// TODO: Send request to server to refresh database.
dynamic refreshMeals() {}

// TODO: Send request to server to edit food in database.
dynamic editFood(var meal) {}

// TODO: Send server request to get meals for the week.
dynamic getMeals() {}

/// The type of editing the user intends to do to a selected food.
///
/// `EditType.change` will allow user to change the name and/or price.
///
/// `EditType.delete` will allow user to remove the food from the database.
///
/// `EditType.add` will allow a user to add an food to the database.
enum EditType {
  change,
  delete,
  add,
}
