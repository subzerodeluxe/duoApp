// met dependencies 
var myOrder = angular.module('myOrder', ['ionic', 'firebase'])

myOrder.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    if(window.cordova && window.cordova.plugins.Keyboard) {
      // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
      // for form inputs)
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);

      // Don't remove this line unless you know what you are doing. It stops the viewport
      // from snapping when text inputs are focused. Ionic handles this internally for
      // a much nicer keyboard experience.
      cordova.plugins.Keyboard.disableScroll(true);
    }
    if(window.StatusBar) {
      StatusBar.styleDefault();
    }
  });
}) 

myOrder.config(function($stateProvider, $urlRouterProvider, $ionicConfigProvider) {
   // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider
  .state('tabs', {
      url: "/tab",
      abstract: true,
      templateUrl: "templates/tabs.html"
    })
    .state('tabs.home', {
      url: "/home",
      views: {
        'home-tab': {
          templateUrl: "templates/home.html"
        }
      }
    })
    .state('tabs.tables', {
      url: "/tables",
      views: {
        'tables-tab': {
          templateUrl: "templates/tables.html",
          controller: 'ListController'
        }
      }
    })
    .state('tabs.detail', {
      url: '/tables/:aId',
      views: {
        'tables-tab' : { 
          templateUrl: 'templates/detail.html',
          controller: 'ListController'   
        }     
      }
    })
    .state('tabs.products', {
      url: '/products',
      views: {
        'tables-tab' : { 
          templateUrl: 'templates/products.html',
          controller: 'ListController'   
        }     
      }
    })
   
    $urlRouterProvider.otherwise('/tab/home');
})