class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :title, :description, :category, :status,
    :created_at, :updated_at
  has_one :compilation
end
