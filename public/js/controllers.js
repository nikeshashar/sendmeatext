var textAppControllers = angular.module('textAppControllers', []);

textAppControllers.controller('DialogCtrl', ['$scope', '$http',
  function ($scope, $http) {

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