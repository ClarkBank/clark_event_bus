require 'bunny'

module Clark
  module EventBus
    class Emitter
      def initialize(topic: nil, options: {})
        raise ArgumentError.new('topic must be present') unless topic && topic.size > 0
        @session = Bunny.new(options)
        @exchange = channel.topic(topic, durable: true, auto_delete: false)
      end

      def trigger(payload, routing_key)
        raise ArgumentError.new('payload message must be present') unless payload && !payload.empty?
        exchange.publish(payload, routing_key: routing_key)
      end

      private
      attr_reader :exchange

      def channel
        @channel ||= create_channel
      end

      def create_channel
        @session.start
        @session.create_channel
      end
    end
  end
end
