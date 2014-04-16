class DiacodePicks.CompilationsRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @get('store').find('compilation')