require 'spec_helper'

describe AddEvent do
  it 'has a version number' do
    expect(AddEvent::VERSION).not_to be nil
  end

  describe '.url' do
    let(:url_double) { instance_double('AddThisEvent::Url') }
    let(:date_time) { DateTime.parse('10/06/1988') }

    before do
      AddEvent.configuration do |config|
        config.client_id = 'fake_id'
      end

      allow(AddEvent::Url).to receive(:new).and_return url_double
    end

    it 'uses the client_id setting if not explicitly passed' do
      described_class.url(starts_at: date_time, ends_at: date_time, title: 'Test Event')

      expect(AddEvent::Url).to have_received(:new).with(starts_at: date_time,
                                                        ends_at: date_time,
                                                        title: 'Test Event',
                                                        options: hash_including(client_id: 'fake_id'))
    end

    it 'overrides the client_id setting if explicitly passed' do
      described_class.url(starts_at: date_time, ends_at: date_time, title: 'Test Event',
                          options: { client_id: 'another_fake_id' })

      expect(AddEvent::Url).to have_received(:new).with(starts_at: date_time,
                                                        ends_at: date_time,
                                                        title: 'Test Event',
                                                        options: hash_including(client_id: 'another_fake_id'))
    end
  end
end
