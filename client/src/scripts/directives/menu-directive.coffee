app.directive 'fooBar', ()->
  { 
    restrict: 'A'
    link: (scope, el, attr, c)->
      console.log "myDirrrrrr"
      console.log 'c-', c
      console.log "attr-", attr
      console.log 'scope-', scope
  }