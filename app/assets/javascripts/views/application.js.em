DiacodePicks.ApplicationView = Ember.View.extend
  didInsertElement: ->
    @$(".dropdown-toggle").dropdown()
