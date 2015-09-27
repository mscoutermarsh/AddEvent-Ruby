require 'spec_helper'

describe AddThisEvent::Url do
  describe '#to_s' do
    let(:title) { 'Event Title' }
    let(:starts_at) { DateTime.new(1988, 10, 06) }
    let(:ends_at) { starts_at }
    let(:options) do
      { client_id: 'ahf0v8gfdztlukul0m667907' }
    end

    subject do
      described_class.new(title: title, starts_at: starts_at, ends_at: ends_at, options: options).to_s
    end

    it 'generates an AddThisEvent url' do
      expect(subject).to eq 'https://addevent.to/dir/?all_day_event=false&client=fake-key' \
                            '&date_format=MM%2FDD%2FYYYY&end=10%2F06%2F1988&endext=AM' \
                            '&endtime=12%3A00%3A00&start=10%2F06%2F1988&startext=AM' \
                            '&starttime=12%3A00%3A00&timezone=%2B00%3A00&title=Event%20Title'
    end
  end
end
