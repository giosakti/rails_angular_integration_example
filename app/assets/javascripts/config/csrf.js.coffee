app.config ($httpProvider) ->
  authToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken