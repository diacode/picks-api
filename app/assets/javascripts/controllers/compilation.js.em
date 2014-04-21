class DiacodePicks.CompilationController extends Ember.ObjectController
  isEditing: false

  actions:
    editIntroText: ->
      @set('isEditing', true)

    saveChanges: ->
      # TODO: Take care of errors when saving
      @get('model').save()
      @set('isEditing', false)

    cancelEditing: ->
      @get('content').rollback()      
      @set('isEditing', false)

    publish: ->
      compilation = @get('model')
      compilation.set('publish', true)
      compilation.save()