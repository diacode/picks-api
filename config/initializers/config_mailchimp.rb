MAILCHIMP_CONFIG = YAML.load(ERB.new(File.new("#{Rails.root}/config/mailchimp.yml").read).result)[Rails.env]
