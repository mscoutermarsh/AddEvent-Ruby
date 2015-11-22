require 'spec_helper'

describe AddEvent::Params do
  describe '#to_h' do
    let(:starts_at) { DateTime.new(1988, 10, 06) }
    let(:ends_at) { starts_at }

    let(:params) do
      { alarm: 60,
        description: 'North End Team Lunch :happy:',
        location: 'Hanover St, Boston, MA 02113',
        organizer: 'Alexander Ovechkin',
        organizer_email: 'coutermarsh.mike@gmail.com',
        title: 'Team Lunch',
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

    it { is_expected.to include(date_format: described_class::DATE_FORMAT) }
    it { is_expected.to include(service: 'appleical') }
    it { is_expected.to include(start: '10/06/1988') }
    it { is_expected.to include(startext: 'AM') }
    it { is_expected.to include(starttime: '00:00:00') }
    it { is_expected.to include(end: '10/06/1988') }
    it { is_expected.to include(endext: 'AM') }
    it { is_expected.to include(endtime: '00:00:00') }
    it { is_expected.to include(timezone: 'Africa/Casablanca') }
    it { is_expected.to include(title: params[:title]) }
    it { is_expected.to include(location: params[:location]) }
    it { is_expected.to include(organizer: params[:organizer]) }
    it { is_expected.to include(organizer_email: params[:organizer_email]) }
    it { is_expected.to include(all_day_event: false) }
    it { is_expected.to include(client: 'fake_key') }
  end
end
