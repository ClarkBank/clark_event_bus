require 'clark/event_bus/listener'

describe Clark::EventBus::Listener do
  let(:args) { { } }
  let(:instance) { described_class.new(args) }
  let(:session) { instance_double(Bunny::Session) }
  let(:channel) { instance_double(Bunny::Channel) }

  before do
    allow(session).to receive(:start)
    allow(session).to receive(:create_channel).and_return(channel)
    allow(Bunny).to receive(:new).and_return(session)
  end

  describe '#new' do
    subject { instance }

    context 'when options is nil' do
      it 'creates an session' do
        expect(Bunny).to receive(:new).with(args)
        subject
      end
    end
  end

  describe '#on' do
    let(:queue_name) { 'clark_queue' }
    let(:queue_options) { { durable: true } }
    let(:queue) { instance_double(Bunny::Queue, subscribe: queue_options) }

    subject { instance.on(queue_name, queue_options) }

    before do
      allow(channel).to receive(:queue).and_return(queue)
    end

    context 'when queue_name is nil' do
      let(:queue_name) { nil }

      it 'raises a ArgumentError' do
        expect{subject}.to raise_error(ArgumentError)
      end
    end

    context 'when queue_name is present' do
      it 'creates an queue' do
        expect(channel).to receive(:queue)
        subject
      end
    end
  end
end
