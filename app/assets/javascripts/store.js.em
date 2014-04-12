# http://emberjs.com/guides/models/using-the-store/

DiacodePicks.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api'
DiacodePicks.ApplicationSerializer = DS.ActiveModelSerializer.extend()

