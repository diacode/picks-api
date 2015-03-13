class LinkSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :url, :title, :description, :category, :created_at, :updated_at, :approved
  has_one :compilation
end
