DiacodePicks.LinksController = Ember.ArrayController.extend
  itemController: 'linksItem'
  selected: Ember.computed.filterBy('[]', 'isChecked', true)
  