require 'redcarpet/render_strip'

class TweetLinkWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(link_id)
    link = Link.find(link_id) 
    client = Twitter::REST::Client.new(TWITTER_CONFIG)
    client.update(get_tweet_content(link))
  end

  def get_tweet_content(link)
    md = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    # We remove any possible markdown markup and strip the ending newline
    desc = md.render(link.description).strip
    title_plus_desc = "#{link.title} - #{desc}"

    # Shortened link + space should be ~25 characters
    if title_plus_desc.length + 25 <= 140
      "#{title_plus_desc} #{link.url}"
    else
      "#{link.title} #{link.url}"
    end
  end
end
