Ember.Handlebars.helper 'time-since', (input) ->
  moment(input).fromNow()