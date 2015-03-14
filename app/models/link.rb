class Link < ActiveRecord::Base
  # Relations
  belongs_to :compilation

  # Validations
  validates :url, presence: true

  # Scopes
  default_scope { order(created_at: :desc) }
  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }
  scope :unused, -> { where(compilation_id: nil) }

  # Callbacks
  before_save :strip_title
  after_update :publish_tweet, if: Proc.new { |link| 
    Rails.configuration.tweet_approved_links &&
    link.approved_changed? && 
    link.approved == true
  }

  def self.discover(unknown_url)
    inspector = MetaInspector.new(unknown_url, allow_redirections: :all)
    {
      url: inspector.url, 
      title: inspector.title,
      description: inspector.meta['description']
    }
  end

  def publish_tweet
    TweetLinkWorker.perform_async(self.id)
  end

  private
    def strip_title
      self.title = title.strip
    end
end
