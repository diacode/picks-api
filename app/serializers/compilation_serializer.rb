class CompilationSerializer < ActiveModel::Serializer
  attributes :id, :installment, :intro, :published_at, :created_at, :updated_at, :publish, :links_count
  has_many :links

  def links_count
    object.link_ids.count
  end
end
