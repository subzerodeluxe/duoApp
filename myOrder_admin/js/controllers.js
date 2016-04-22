myOrder.controller('ListController', ['$scope', '$firebaseArray', '$stateParams', '$state', '$ionicListDelegate', '$ionicModal', 
	'Tables', 'Drinks', function($scope, $firebaseArray, $stateParams, $state, $ionicListDelegate, $ionicModal, Tables, Drinks) {

    $scope.tables = Tables; 
    $scope.whichtable  = $stateParams.aId;
    
    $scope.drinks = Drinks; 
    //$scope.whichtable = Drinks.get($stateParams.drinkId);
    //$scope.drinks = Drinks.all();
    //$scope.whichdrink  = $state.params.aId;

    // welke drank push? Aan de hand van key
    console.log($scope.whichtable);
	var ref = new Firebase('https://elshampoo.firebaseio.com/tables/' + {{whichtable}} + '/' + 'orders');
	var drinksInfo = $firebaseArray(ref);

	$scope.addDrink = function() {
		var myData = {
			name: $scope.numberDrinks,
			price: $scope.price, 
			quantity: $scope.quantity
		}; //myData

		drinksInfo.$add(myData); 
	}; // AddDrink

	$ionicModal.fromTemplateUrl('templates/modal.html', {
		scope: $scope
			}).then(function(modal) {
		$scope.modal = modal;
			}); 
}]);