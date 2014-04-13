#= require jquery
#= require jquery_ujs
#= require handlebars
#= require ember
#= require ember-data
#= require bootstrap/dropdown
#= require jquery.icheck
#= require_self
#= require diacode_picks

# for more details see: http://emberjs.com/guides/application/
window.DiacodePicks = Ember.Application.create
  LOG_TRANSITIONS: true
  LOG_VIEW_LOOKUPS: true
  LOG_ACTIVE_GENERATION: true