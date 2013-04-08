app.run ($rootScope, $state, $stateParams) ->

  # You can turn this off on production.
  $rootScope.$debugMode = "on" # "off"

  # Capture current state and stateParams, this variable can be showed
  # in browser for debug purpose.
  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams