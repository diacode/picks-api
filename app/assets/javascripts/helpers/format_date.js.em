Ember.Handlebars.helper 'format-date', (input, format_str) ->
  moment(input).format(format_str)