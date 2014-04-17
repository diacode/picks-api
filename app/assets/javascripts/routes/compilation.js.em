class DiacodePicks.CompilationRoute extends Ember.Route with Ember.SimpleAuth.AuthenticatedRouteMixin
  model: (params) ->
    @get('store').find('compilation', params.compilation_id)