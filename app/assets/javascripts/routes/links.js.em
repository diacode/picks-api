DiacodePicks.LinksRoute = Ember.Route.extend Ember.SimpleAuth.AuthenticatedRouteMixin,
  model: ->
    @get('store').find('link')
  