class CompilationSerializer < ActiveModel::Serializer
  attributes :id, :installment, :published_at, :created_at, :updated_at
end
