angular.module("uiRouter.utils.service", []).factory "utils", ->
  
  # Util for finding an object by its 'id' property among an array
  findById: findById = (a, id) ->
    i = 0

    while i < a.length
      return a[i]  if a[i].id is id
      i++
    null

  findStates: findStates = (a, state) ->
    i = 0
    
    st = state.current.url.substring(1)

    while i < a.length
      return ({"current" : a[i].id, "next" : (if i == a.length-1 then null else a[++i].id) }) if a[i].id is st
      i++
    null