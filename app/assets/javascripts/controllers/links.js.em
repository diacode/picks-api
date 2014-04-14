DiacodePicks.LinksController = Ember.ArrayController.extend
  # Sorting settings
  sortProperties: ['createdAt']
  sortAscending: false
  # End of sorting settings
  itemController: 'linksItem'
  selected: Ember.computed.filterBy('[]', 'isChecked', true)
  newLinkUrl: ''
  actions:
    addLink: ->
      newLink = @store.createRecord('link', {
        url: @get('newLinkUrl')
        createdAt: new Date()
      })

      newLink.save().then (=>
        @set('newLinkUrl', "")
      ), -> 
        newLink.rollback()
        alert('Error!')
    deleteSelection: ->
      # TODO: Figure out some way to delete the selection using only one AJAX call
      selectedItems = @get('selected')
      selectedItems.forEach (item) ->
        linkObject = item.get('content')
        linkObject.destroyRecord()