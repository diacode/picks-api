DiacodePicks.LinksItemController = Ember.ObjectController.extend
  isEditing: false
  isChecked: false
  toggle: ->
    @toggleProperty('isChecked')
  actions:
    editLink: ->
      @set('isEditing', true)
    saveChanges: ->
      @get('model').save()
      @set('isEditing', false)

    cancelEditing: ->
      @get('content').rollback()      
      @set('isEditing', false)
