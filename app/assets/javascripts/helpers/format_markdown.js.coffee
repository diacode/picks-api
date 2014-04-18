showdown = new Showdown.converter()
 
Ember.Handlebars.helper 'format-markdown', (input) ->
  return "" if input == null
  new Handlebars.SafeString(showdown.makeHtml(input))
