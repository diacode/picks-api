DiacodePicks.LinksItemController = Ember.ObjectController.extend
  isChecked: false
  toggle: ->
    @toggleProperty('isChecked')