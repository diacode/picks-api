namespace :buffer_watch do 
  task start: :environment do
    ready_links = Link.approved.unused

    if ready_links.count >= 10 # <- TODO: Replace with some config variable
      compilation = Compilation.new
      compilation.link_ids = ready_links.map { |e| e.id }
      
      if compilation.save
        CompilationPublishingWorker.perform_async(compilation.id)    
      end
    end
  end 
end