DiacodePicks.LinksRoute = Ember.Route.extend
  model: ->
    @get('store').find('link')
    