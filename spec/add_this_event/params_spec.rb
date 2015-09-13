require 'spec_helper'

describe AddThisEvent::Params do
  describe '#to_h' do
    let(:title) { 'Event Title' }
    let(:starts_at) { DateTime.new(1988, 10, 06) }
    let(:ends_at) { starts_at + 60 * 60 }

    let(:params) do
      { title: title,
        client_id: 'fake_key',
        starts_at: starts_at,
        ends_at: ends_at,
        service: :appleical }
    end

    subject do
      described_class.new(params).to_h
    end

    it 'raises an error if client_id is nil' do
      params[:client_id] = nil

      expect do
        subject
      end.to raise_error ArgumentError
    end

    it { is_expected.to include(start: '10/06/1988') }
    it { is_expected.to include(date_format: described_class::DATE_FORMAT) }
    it { is_expected.to include(service: 'appleical') }
    it { is_expected.to include(startext: 'AM') }
    it { is_expected.to include(starttime: '12:00:00') }
    it { is_expected.to include(timezone: '+00:00') }
    it { is_expected.to include(title: title) }
    it { is_expected.to include(location: nil) }
    it { is_expected.to include(organizer: nil) }
    it { is_expected.to include(organizer_email: nil) }
    it { is_expected.to include(all_day_event: false) }
    it { is_expected.to include(client: 'fake_key') }

  end
end
