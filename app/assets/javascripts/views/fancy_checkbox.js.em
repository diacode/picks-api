# Based on: https://github.com/fronteed/iCheck/issues/4#issuecomment-39035412
DiacodePicks.FancyCheckbox = Ember.Checkbox.extend
  tagName: 'input'
  didInsertElement: ->
    @$().iCheck
      checkboxClass: 'icheckbox_square-blue fancy-checkbox'
