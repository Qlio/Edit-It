$ ->
  options =
    url: "/hello"
    data:
      token: "t0k3n"
    success: (resp) -> console.log "YES! Successful!", resp
    done: (resp) -> console.log "HEY! I'm done!", resp

  $(".double-click").editit "dblclick", options
