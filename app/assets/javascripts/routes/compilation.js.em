class DiacodePicks.CompilationRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: ->
    @get('store').find('compilation', params.compilation_id)