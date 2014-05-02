class CompilationPublisher
  include RenderAnywhere

  # TODO: Implement some kind of error management
  def publish(compilation)
    gibbon = Gibbon::API.new(MAILCHIMP_CONFIG['api_key'])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    
    # Rendering email content into a string
    email_content = render(
      layout: 'newsletter',
      template: 'compilations/deliverable',
      locals: {compilation: compilation, markdown: markdown}
    )

    # Campaign creation
    campaign_creation_response = gibbon.campaigns.create(
      type: 'regular',
      content: {
        sections: {
          main: email_content
        }
      },
      options: {
        from_email: MAILCHIMP_CONFIG['from_email'],
        from_name: MAILCHIMP_CONFIG['from_name'],
        subject: "#{MAILCHIMP_CONFIG['subject_prefix']} ##{compilation.installment}",
        list_id: MAILCHIMP_CONFIG['list_id'],
        template_id: MAILCHIMP_CONFIG['template_id']
      }
    )

    # Campaign delivery to subscribers
    campaign_send_response = gibbon.campaigns.send(cid: campaign_creation_response['id'])

    # Finally we mark the compilation as published if the API response says so
    compilation.update_attribute(:published_at, DateTime.now) if campaign_send_response['complete']
  end
end