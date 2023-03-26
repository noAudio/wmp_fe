import 'dart:html';

void main() {
  var renewButton = querySelector('#renew') as ButtonElement;
  var editButton = querySelector('#edit') as ButtonElement;

  // TODO: Add functions that call server
  renewButton.addEventListener('click', (event) => print('Renewing'));
  editButton.addEventListener('click', (event) => print('Editing'));
}
