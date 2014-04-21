class CompilationPublishingWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  # See: http://stackoverflow.com/a/16381788
  def perform(compilation_id)
    s = Redis::Semaphore.new("compilation_publishing_for_#{compilation_id}".to_sym, redis: NonBlockingRedis.new(connection: "localhost"))
    
    if s.lock -1
      begin
        compilation = Compilation.find(compilation_id)
        
        unless compilation.is_published?
          cp = CompilationPublisher.new
          cp.publish(compilation)
        end
      rescue => e
        # ignore; do nothing
      ensure
        s.unlock
      end
    end
  end
end