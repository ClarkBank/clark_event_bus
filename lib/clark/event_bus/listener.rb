require 'bunny'

module Clark
  module EventBus
    class Listener
      def initialize(options = {})
        @session = Bunny.new(options)
      end

      def on(queue_name, options = {}, &block)
        raise ArgumentError.new('queue name must be present') unless queue_name && queue_name.size > 0
        queue(queue_name).subscribe(options, &block)
      end

      private
      def queue(name)
        channel = create_channel
        channel.queue(name, {durable: true})
      end

      def create_channel
        @channel ||= begin
          @session.start
          @session.create_channel
        end
      end
    end
  end
end
