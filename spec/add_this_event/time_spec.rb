require 'spec_helper'

describe AddThisEvent::Time do
  describe '.standardize_time' do
    it 'converts time to TIMEZONE_NAME' do
      time = Time.now
      expect(described_class.standardize_timezone(time)).to eq'hi'
    end
  end
end
