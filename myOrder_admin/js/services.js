myOrder.factory('Tables', ['$firebaseArray', function($firebaseArray) {
  var itemsRef = new Firebase('https://elshampoo.firebaseio.com/tables');
  return $firebaseArray(itemsRef);
}])

myOrder.factory('Drinks', ['$firebaseArray', function($firebaseArray) {
  var itemsRef = new Firebase('https://elshampoo.firebaseio.com/drinks');
  return $firebaseArray(itemsRef);
}]); 