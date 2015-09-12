require 'spec_helper'

describe AddThisEvent::Url do
  describe '#to_s' do
    let(:title) { 'Event Title' }
    let(:start_at) { Time.now }
    let(:end_at) { Time.now + 60 * 60 }
    let(:options) do
      { hi: true }
    end

    subject do
      described_class.new(title: title, start_at: start_at, end_at: end_at, options: options).to_s
    end

    it { is_expected.to eq 'buts' }
  end
end
