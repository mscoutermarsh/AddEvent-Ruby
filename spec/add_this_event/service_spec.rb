require 'spec_helper'

describe AddThisEvent::Service do
  describe '#new' do
    it 'raises ArgumentError if an invalid service is passed' do
      expect do
        described_class.new('fake-service')
      end.to raise_error ArgumentError
    end

    it 'does not raise an error for valid or nil service' do
      valid_services = described_class::VALID_SERVICES + [nil, '']

      expect do
        valid_services.each { |service| described_class.new(service) }
      end.to_not raise_error
    end
  end

  describe '#value' do
    it 'returns nil if nil is passed' do
      expect(described_class.new(nil).value).to eq nil
    end

    it 'returns an nil if and empty string is passed' do
      expect(described_class.new('').value).to eq nil
    end

    it 'returns service name as a string' do
      expect(described_class.new('appleical').value).to eq 'appleical'
    end

    it 'handles services as symbols' do
      expect(described_class.new(:appleical).value).to eq 'appleical'
    end
  end
end
