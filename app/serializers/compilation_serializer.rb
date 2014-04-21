class CompilationSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :installment, :intro, :published_at, :created_at, :updated_at, :publish
  has_many :links
end
