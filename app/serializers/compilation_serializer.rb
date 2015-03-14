class CompilationSerializer < ActiveModel::Serializer
  attributes :id, :installment, :intro, :published_at, :created_at, :updated_at, :publish
  has_many :links
end
