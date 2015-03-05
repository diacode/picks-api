class TweetLinkWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(link_id)
    link = Link.find(link_id) 
    client = Twitter::REST::Client.new(TWITTER_CONFIG)
    client.update("#{link.title} #{link.url}")
  end
end
