module Clark
  module EventBus
    class Emitter
      def initialize
      end

      def trigger(payload, routing_key)
      end

      private
      def topic_options
        {
          topic: ENV['RABBIT_TOPIC'],
          options: {
            vhost: ENV['RABBIT_VHOST'],
            host: ENV['RABBIT_HOST'],
            heartbeat: 1,
            continuation_timeout: 60000
          }
        }
      end
    end
  end
end
