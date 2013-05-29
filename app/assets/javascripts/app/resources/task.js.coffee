app.factory "Task", ($resource, apiPrefix) ->
  $resource( apiPrefix + "/tasks/:id", 
    id: "@id"
  ,
    update:
      method: "PUT"
  )
