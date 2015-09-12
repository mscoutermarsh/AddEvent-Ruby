require 'spec_helper'

describe AddThisEvent::Params do
  describe '#to_h' do
    let(:title) { 'Event Title' }
    let(:starts_at) { DateTime.new(1988, 10, 06) }
    let(:ends_at) { starts_at + 60 * 60 }

    let(:params) do
      { title: title,
        starts_at: starts_at,
        ends_at: ends_at,
        service: :appleical }
    end

    subject do
      described_class.new(params).to_h
    end

    it { is_expected.to include(start: '10/06/1988') }
    it { is_expected.to include(date_format: described_class::DATE_FORMAT) }
    it { is_expected.to include(service: 'appleical') }
    it { is_expected.to include(startext: 'AM') }
    it { is_expected.to include(starttime: '12:00:00') }
  end
end
