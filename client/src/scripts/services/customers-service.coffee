# A RESTful factory for retrieving fields/customers from 'customers.json'
angular.module("uiRouter.customers.service", []).factory "rest", ["$resource", "$http", "utils", ($resource, $http, utils) ->
  path = '/database/template.json'
  $http.defaults.headers.common['Auth-Token'] = 'login YmVlcDpi'

  customers = $http.get(path)
    .then((resp) ->
      resp.data.customers
  )

  Db = $resource '/database/customers'




  factory = {}
  factory.all = ->
    customers

  factory.put = (data)->
      $http.post('/assets/jsons/customers:id=curr', data)
        .then((resp) -> 
      )

  factory.get = (id) ->
    customers.then ->
      utils.findById customers, id

  factory.getAll = (id) ->
    Db.query {id: 'all'}, (data)->
      console.log data
  factory
 ]