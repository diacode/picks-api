DiacodePicks.LinksController = Ember.ArrayController.extend
  # Sorting settings
  sortProperties: ['createdAt']
  sortAscending: false
  # End of sorting settings
  itemController: 'linksItem'
  # selected will return all those views checked
  selected: Ember.computed.filterBy('[]', 'isChecked', true)
  # selectedLinks will return all those links objects based on 'selected' property
  selectedLinks: Ember.computed.mapBy('selected', 'content')
  newLinkUrl: ''
  actions:
    addLink: ->
      # TODO: Use regex to check if the link is a valid url
      unless Ember.isBlank(@get('newLinkUrl'))
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
      @get('selectedLinks').invoke('destroyRecord')

    createCompilationWithSelection: ->
      self = @
      newCompilation = @store.createRecord('compilation')

      # Adding links to compilation and saving.
      # Note - We have to call save method inside the promise. See:
      # http://stackoverflow.com/questions/21529816/set-hasmany-array-during-record-creation#comment32597322_21539764
      compilationLinks = @get('selectedLinks').toArray()
      newCompilation.get('links').then (links) ->
        links.pushObjects(compilationLinks)
        newCompilation.save().then (=>
          self.transitionToRoute('compilation', newCompilation)
        ), ->
          alert "Error: Something went wrong!"