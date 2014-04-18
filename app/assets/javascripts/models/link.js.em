class DiacodePicks.Link extends DS.Model
  url: DS.attr('string')
  title: DS.attr('string')
  description: DS.attr('string')
  category: DS.attr('string')
  status: DS.attr('string')
  createdAt: DS.attr('date')
  updatedAt: DS.attr('date')
  # Relationships
  compilation: DS.belongsTo('compilation')
  # Computed properties
  +computed compilation
  isUsed: -> @compilation isnt null