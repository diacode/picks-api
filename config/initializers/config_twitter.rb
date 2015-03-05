if Rails.configuration.tweet_approved_links
  TWITTER_CONFIG = YAML.load(ERB.new(File.new("#{Rails.root}/config/twitter.yml").read).result)[Rails.env]
end
