app.controller "TasksController", ($scope, $http, $location, $state, $stateParams) ->

  # =========================================================================
  # Initialize
  # =========================================================================

  $scope.tasks = {}
  if $state.current.name == 'tasks'
    $http.get("/api/tasks"

    # success
    ).then ((response) ->
      $scope.tasks = response.data
    
    # failure
    ), (error) ->

  $scope.task = {}
  if $state.current.name == 'edit'
    $http.get("/api/tasks/#{$stateParams['id']}"

    # success
    ).then ((response) ->
      $scope.task = response.data

    # failure
    ), (error) ->

  # =========================================================================
  # Create
  # =========================================================================

  $scope.create = ->
    $http.post("/api/tasks",
      task:
        title: $scope.task.title
        description: $scope.task.description

    # success
    ).then ((response) ->
      $location.path "/tasks"

    # failure
    ), (error) ->

  # =========================================================================
  # Update
  # =========================================================================

  $scope.update = ->
    $http.put("/api/tasks/#{$scope.task.id}",
      task:
        title: $scope.task.title
        description: $scope.task.description

    # success
    ).then ((response) ->
      $location.path "/tasks"

    # failure
    ), (error) ->

  # =========================================================================
  # Destroy
  # =========================================================================

  $scope.destroy = (id) ->
    $http.delete("/api/tasks/#{id}"

    # success
    ).then ((response) ->
      $http.get("/api/tasks").then ((response) ->
        $scope.tasks = response.data
      ), (error) ->

    # failure
    ), (error) ->

  return false