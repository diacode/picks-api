class DiacodePicks.Compilation extends DS.Model
  installment: DS.attr 'number'
  publishedAt: DS.attr 'date'
  createdAt: DS.attr 'date'
  updatedAt: DS.attr 'date'
  # Relationships
  links: DS.hasMany 'link'
  # Computed properties
  +computed publishedAt
  isPublished: -> @publishedAt isnt null