class CompilationSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :installment, :published_at, :created_at, :updated_at
  has_many :links
end
