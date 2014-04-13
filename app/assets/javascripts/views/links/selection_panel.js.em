DiacodePicks.LinksSelectionPanelView = Ember.View.extend
  templateName: 'links/selection_panel'
  tagName: 'div'
  classNames: ['link-selection-panel']
  classNameBindings: ['isVisible']
  isVisible: false
  selectedItemsCountChanged: (->
    selectedItemsCount = @get('selectedItemsCount')
    @set('isVisible', selectedItemsCount > 0)
  ).observes('selectedItemsCount')