app = angular.module('App', [
  'uiRouter.customers.service'
  'uiRouter.utils.service'
  'appTemplates'
  'ngResource'
  'ngLodash'
  'ui.router'
  'angular.validation'
  'ui.mask'
])
.run(['$rootScope', '$state', '$stateParams',($rootScope, $state, $stateParams) ->
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams
  ]
)

# @if ENV='production'
app.appRoot = ''
# @endif


# @if ENV='development'
app.appRoot = 'http://localhost:3001'
# @endif


app.config ($stateProvider, $urlRouterProvider, $locationProvider, $httpProvider, $sceProvider) ->


  $locationProvider.html5Mode(true)
  $urlRouterProvider
  # .when('/a?id', '/authorization/:id')
    .otherwise('/authorization') 

  $stateProvider
    .state 'public',
      abstract: true,
      template: '<ui-view/>',
      resolve: 
        data: (rest)->
                rest.all()

      controller: ($scope, $state, data, utils, rest) -> 
                     $scope.content = data;
                     $scope.inf = utils.findById($scope.content, 'initial').inf
                     $scope.newCustomer = []
      data:
        requiresLogin: false

    .state 'public.authorization',
      url: '/authorization'
      templateUrl: 'pages/authorization.html'
      controller: 'MainCtrl'

    .state 'public.personal',
      url: '/personal'
      templateUrl: 'pages/personalInf.html'
      controller: 'MainCtrl'

    .state 'public.contacts',
      url: '/contacts'
      templateUrl: 'pages/contacts.html'
      controller: 'MainCtrl'

    .state 'public.submit',
      url: '/submit'
      templateUrl: 'pages/submit.html'
      controller: 'MainCtrl'

    .state 'public.review',
      url: '/review'
      templateUrl: 'pages/review.html'
      resolve: 
        data: (rest)->
          rest.getAll()
      controller: 'MainCtrl'

    .state 'public.customers',
      url: '/customers'
      templateUrl: 'pages/customers.html'
      controller: 'MainCtrl'

