var textAppControllers = angular.module('textAppControllers', []);

textAppControllers.controller('DialogCtrl', ['$scope', '$http',
  function ($scope, $http) {
    // create a blank object to hold our form information
      // $scope will allow this to pass between controller and view
      $scope.messageData = {};
      $scope.processForm = function() {
        $http({
              method  : 'POST',
              url     : '/messages',
              data    : $.param($scope.messageData),  // pass in data as strings
              headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
          });
        }
    }]);

textAppControllers.controller('DialogResponseCtrl', ['$scope', '$routeParams',
  function($scope, $routeParams) {
  }]);

textAppControllers.controller('SettingsCtrl', ['$scope', '$routeParams',
  function($scope, $routeParams) {
  	Wix.UI.initialize({});
  	$("[wix-model='senderNumber']").getCtrl().setValidationFunction(function(value){
            return value < 10;
    });
  }]);
