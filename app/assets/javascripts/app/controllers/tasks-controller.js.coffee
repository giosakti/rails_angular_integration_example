app.controller "TasksController", ($scope, $http, $location, $state, $stateParams, Task) ->

  # =========================================================================
  # Initialize
  # =========================================================================

  $scope.tasks = {}
  $scope.task = {}

  # =========================================================================
  # Show
  # =========================================================================

  if $state.current.name == 'tasks'
    Task.query(
      {}
      
      # Success
    , (response) ->
      $scope.tasks = response

      # Error
    , (response) ->
    )

  if $state.current.name == 'show'
    Task.get
      id: $stateParams['id']

      # Success
    , (response) ->
      $scope.task = response

      # Error
    , (response) ->

  # =========================================================================
  # Create
  # =========================================================================

  $scope.create = ->
    Task.save(
      {}
    , task:
        title: $scope.task.title
        description: $scope.task.description

      # Success
    , (response) ->
      $location.path "/tasks"

      # Error
    , (response) ->
    )

  # =========================================================================
  # Update
  # =========================================================================

  if $state.current.name == 'edit'
    Task.get
      id: $stateParams['id']

      # Success
    , (response) ->
      $scope.task = response

      # Error
    , (response) ->

  $scope.update = ->
    Task.update
      id: $stateParams['id']
    , task:
        title: $scope.task.title
        description: $scope.task.description

      # Success
    , (response) ->
      $location.path "/tasks"

      # Error
    , (response) ->

  # =========================================================================
  # Destroy
  # =========================================================================

  $scope.destroy = (id) ->
    Task.delete
      id: id

      # Success
    , (response) ->
      i = 0
      while i < $scope.tasks.length
        if $scope.tasks[i]['id'] is id
          $scope.tasks.splice(i,1)
        i++

      # Error
    , (response) ->
