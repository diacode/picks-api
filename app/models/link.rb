class Link < ActiveRecord::Base
  STATUSES = %w(new used discarded)

  # Validations
  validates :url, presence: true
  validates :status, inclusion: {in: STATUSES}

  # Callbacks
  after_initialize :set_defaults

  def self.discover(unknown_url)
    inspector = MetaInspector.new(unknown_url, allow_redirections: :all)
    {
      url: inspector.url, 
      title: inspector.title,
      description: inspector.meta['description']
    }
  end

  private 
    def set_defaults
      self.status ||= 'new'
    end
end
