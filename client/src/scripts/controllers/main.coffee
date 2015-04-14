app.controller 'MainCtrl', ($scope, $resource, $state, $stateParams, utils, rest, $validation,  $injector, data) ->
  
  states = utils.findStates($scope.inf, $state)
  $scope.content = utils.findById($scope.inf, "#{ states.current }").fields
  console.log "next state is : #{states.next}"
  $scope.goTo = () ->
    $state.go "public.#{ states.next }"

  $scope.next = (form) ->
    if form then (
      $validation.validate(form).success(->
        $scope.save($scope.newCustomer, $scope.content)
        $scope.goTo()
      ).error -> console.log 'fill out all the fields!')
    else
      rest.put($scope.newCustomer) 
      $scope.goTo()

  $scope.save = (obj, arr)->
    i = 0
    console.log obj
    while i < arr.length
      obj.push(arr[i])
      i++
    console.log  obj
