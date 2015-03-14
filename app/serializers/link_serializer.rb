class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :description, :category, :created_at, :updated_at, :approved, :compilation_id
end
