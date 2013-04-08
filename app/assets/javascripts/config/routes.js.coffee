# Configure 'app' routing. The $stateProvider and $urlRouterProvider
# will be automatically injected into the configurator.
app.config ($stateProvider, $urlRouterProvider) ->

  # Make sure that any other request beside one that is already defined
  # in stateProvider will be redirected to root.
  $urlRouterProvider
    .otherwise("/")

  # Define 'app' states
  $stateProvider
    .state "default",
      abstract: true
      views:
        "":
          controller: "ApplicationController"
          templateUrl: "/assets/layouts/default.html.erb"

    # Tasks
    .state "tasks",
      parent: "default"
      url: "/tasks"
      views:
        "":
          controller: "TasksController"
          templateUrl: "/assets/tasks/index.html.erb"

    .state "new",
      parent: "tasks"
      url: "/new"
      views:
        "@default":
          controller: "TasksController"
          templateUrl: "/assets/tasks/new.html.erb"

    .state "edit",
      parent: "tasks"
      url: "/:id/edit"
      views:
        "@default":
          controller: "TasksController"
          templateUrl: "/assets/tasks/edit.html.erb"