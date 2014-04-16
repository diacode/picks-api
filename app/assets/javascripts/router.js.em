# For more information see: http://emberjs.com/guides/routing/

DiacodePicks.Router.map ->
  @route('login')
  @resource('links')
  @resource('compilations')