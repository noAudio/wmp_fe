/// The type of editing the user intends to do to a selected food.
///
/// `EditType.change` will allow user to change the name and/or price.
///
/// `EditType.delete` will allow user to remove the food from the database.
///
/// `EditType.add` will allow a user to add an food to the database.
enum EditType { change, delete, add }
