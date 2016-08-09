require 'clark/event_bus/emitter'

describe Clark::EventBus::Emitter do
  let(:instance) { described_class.new(args) }
  let(:session) { instance_double(Bunny::Session) }
  let(:channel) { instance_double(Bunny::Channel) }
  let(:exchange) { instance_double(Bunny::Exchange) }

  before do
    allow(session).to receive(:start)
    allow(session).to receive(:create_channel).and_return(channel)
    allow(channel).to receive(:topic).and_return(exchange)
    allow(exchange).to receive(:publish)
    allow(Bunny).to receive(:new).and_return(session)
  end

  describe '#new' do
    subject { instance }

    context 'when topic is present' do
      let(:args) { { topic: 'topic' } }

      it 'creates an exchange' do
        expect(channel).to receive(:topic).with('topic', durable: true, auto_delete: false)
        subject
      end
    end

    context 'when topic is nil' do
      let(:args) { { topic: nil } }

      it 'raises a ArgumentError' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end
  end

  describe '#trigger' do
    subject { instance.trigger(payload, routing_key) }

    context 'when payload and routing_key are present' do
      let(:args) { { topic: 'topic', options: { addresses: 'localhost:5672' } } }
      let(:payload) { 'payload' }
      let(:routing_key) { 'routing_key' }

      it 'publishes a message on exchange' do
        expect(exchange).to receive(:publish)
          .with(payload, routing_key: routing_key, persistent: true)
        subject
      end
    end

    context 'when payload is nil' do
      let(:args) { { topic: 'topic', options: { addresses: 'localhost:5672' } } }
      let(:payload) { nil }
      let(:routing_key) { 'routing_key' }

      it 'raises an ArgumentError' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end
  end
end
