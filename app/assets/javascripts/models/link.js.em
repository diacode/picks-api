DiacodePicks.Link = DS.Model.extend
  url: DS.attr('string')
  title: DS.attr('string')
  description: DS.attr('string')
  category: DS.attr('string')
  status: DS.attr('string')
  createdAt: DS.attr('date')
  updatedAt: DS.attr('date')