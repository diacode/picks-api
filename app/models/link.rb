class Link < ActiveRecord::Base
  # Relations
  belongs_to :compilation

  # Validations
  validates :url, presence: true

  # Scopes
  scope :approved, -> { where(approved: true) }
  scope :unused, -> { where(compilation_id: nil) }

  def self.discover(unknown_url)
    inspector = MetaInspector.new(unknown_url, allow_redirections: :all)
    {
      url: inspector.url, 
      title: inspector.title,
      description: inspector.meta['description']
    }
  end
end
