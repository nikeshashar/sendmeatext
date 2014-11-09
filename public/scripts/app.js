'use strict';

angular
    .module('vineApp', [
        'ngCookies',
        'ngResource',
        'ngSanitize',
        'ngRoute',
        'chieffancypants.loadingBar',
        'ngAnimate'
    ])
    .config(function ($routeProvider, config) {
        if (config && config.view === 'settings') {
            $routeProvider
                .when('/', {
                    templateUrl: '/views/settings.html',
                    controller: 'SettingsCtrl'
                })
        } else {
            $routeProvider
                .when('/', {
                    templateUrl: '/views/main.html',
                    controller: 'MainCtrl'
                })
                .when('/settings/', {
                    templateUrl: '/views/settings.html',
                    controller: 'SettingsCtrl'
                })
                .otherwise({
                    redirectTo: '/'
                });
        }
    });
