var textApp = angular.module('textApp', [
'ngRoute',
'textAppControllers'
]);

textApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/dialog', {
        templateUrl: 'partials/dialog.html',
        controller: 'DialogCtrl'
      }).
      when('/dialog/response', {
        templateUrl: 'partials/dialog-response.html',
        controller: 'DialogResponseCtrl'
      }).
      when('/settings', {
        templateUrl: 'partials/settings.html',
        controller: 'SettingsCtrl'
      }).
      // otherwise({
      //   redirectTo: '/dialog'
      // });
  }]);