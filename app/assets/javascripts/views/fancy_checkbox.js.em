# Based on: https://github.com/fronteed/iCheck/issues/4#issuecomment-39035412
DiacodePicks.FancyCheckbox = Ember.Checkbox.extend
  didInsertElement: ->
    self = @
    elm = @$()

    elm.iCheck
      checkboxClass: 'icheckbox_square-blue fancy-checkbox'

    elm.on 'ifChecked', (e) ->
      self.set('checked', true)

    elm.on 'ifUnchecked', (e) ->
      self.set('checked', false)

    return
