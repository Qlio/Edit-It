$.fn.editit = (event, options) ->
  defaults =
    url: ""
    data: {}
    done: ->
    success: ->
  settings = $.extend(defaults, options)

  $selector = $(@).selector
  onChange = (input) ->
    $.each $(input).parent().data(), (key, value) ->
      unless key == "name" then settings.data[key] = value
    settings.data[$(input).attr("name")] = $(input).val()

    $.post(settings.url, settings.data, settings.success)
      .done settings.done

  $(document).on event, $selector, ->
    return if $($selector).find("input").length

    input = $("""
      <input type="text" value="#{ $(@).html() }" name="#{ $(@).data("name") }">
    """)
    $(@).html(input)
    input.focus().select()

    input.on
      focusout: ->
        onChange @
        $(@).closest($selector).html input.val()
      change: ->
        onChange @
        $(@).closest($selector).html input.val()
      keypress: (e) ->
        if e.keyCode == 13
          onChange @
          $(@).closest($selector).html input.val()

  return @
