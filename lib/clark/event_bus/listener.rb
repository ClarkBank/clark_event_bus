require 'bunny'

module Clark
  module EventBus
    class Listener
      def initialize(options = {})
        @session = Bunny.new(options)
      end

      def on(queue_name, options = {}, &block)
        raise ArgumentError.new('queue name must be present') unless queue_name && queue_name.size > 0

        queue(queue_name)
          .bind(event_bus_exchange, routing_key: queue_name)
          .subscribe(options, &block)
      end

      private
      def queue(name)
        channel.queue(name, durable: true)
      end

      def channel
        @channel ||= create_channel
      end

      def create_channel
        @session.start
        @session.create_channel
      end

      def event_bus_exchange
        channel.topic('events', durable: true, auto_delete: false)
      end
    end
  end
end
