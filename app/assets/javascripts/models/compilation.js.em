class DiacodePicks.Compilation extends DS.Model
  installment: DS.attr 'number', readOnly: true
  publishedAt: DS.attr 'date', readOnly: true
  createdAt: DS.attr 'date', readOnly: true
  updatedAt: DS.attr 'date', readOnly: true
  # Relationships
  links: DS.hasMany 'link', async: true
  # Computed properties
  +computed publishedAt
  isPublished: -> @publishedAt isnt null

# Compilation serializer.
# Right now we need this because right now DS.ActiveModelSerializer doesn't serialize hasMany associations
DiacodePicks.CompilationSerializer = DS.ActiveModelSerializer.extend(serializeHasMany: (record, json, relationship) ->
  inflector = Ember.Inflector.inflector
  key = relationship.key
  relationshipType = DS.RelationshipChange.determineRelationshipType(record.constructor, relationship)
  json[inflector.singularize(key) + "_ids"] = Ember.get(record, key).mapBy("id")  if relationshipType is "manyToNone" or relationshipType is "manyToMany" or relationshipType is "manyToOne"
  return
)

# TODO support for polymorphic manyToNone and manyToMany relationships