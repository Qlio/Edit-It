$.fn.editit = (event, options) ->
  $defaults =
    url: ""
    data: {}
  $settings = $.extend($defaults, options)

  $selector = $(this).selector
  onChange = (input) ->
    $settings.data[$(input).attr("name")] = $(input).val()

    $.post $settings.url, $settings.data

  $(document).on event, $selector, ->
    return if $($selector).find("input").length

    $input = $("""
      <input type="text" value="#{ $(this).html() }"
          name="#{ $(this).data("name") }">""")
    $(this).html($input)
    $input.focus().select()

    $input.on
      focusout: ->
        onChange this
        $(this).closest($selector).html $input.val()
      change: ->
        onChange this
        $(this).closest($selector).html $input.val()
      keypress: (e) ->
        if e.keyCode == 13
          onChange this
          $(this).closest($selector).html $input.val()

  return this
