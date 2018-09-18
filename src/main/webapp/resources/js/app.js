/**
 * @ngDoc module
 * @name ng.module:myApp
 *
 * @description
 * This module is here for sample purposes
 */
var app = angular.module('myApp', ['ngCookies','bw.paging']);

/**
 * @ngDoc controller
 * @name ng.module:myApp
 *
 * @description
 * This controller is here for sample purposes
 */
app.controller('sampleCtrl', ['$scope', '$http', '$log', '$cookies','$timeout',
    function ($scope, $http, $log, $cookies, $timeout) {

    if ($scope.currentPage === undefined) {
        $scope.currentPage = '1';
        fetch();
    }
    var pendingTask;

    $scope.change = function() {
        if (pendingTask) {
            clearTimeout(pendingTask);
        }

        pendingTask = setTimeout(fetch, 800);

    };

    function fetch() {
        $http.get("http://localhost:8080/api/parts" + "?page=" + $scope.currentPage)
            .then(function (response) {
                $scope.parts = response.data;
            });
        $http.get("http://localhost:8080/api/count")
            .then(function (response) {
                $scope.total = response.data;
            });
    }

}]);

app.config(['$httpProvider', function($httpProvider) {
    $httpProvider.defaults.withCredentials = true;
}]);
