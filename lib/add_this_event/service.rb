module AddThisEvent
  class Service
    VALID_SERVICES = %w(appleical google outlook outlookcom yahoo)

    def initialize(service)
      fail(ArgumentError, "service must set to #{VALID_SERVICES.join(', ')} or nil") unless valid_service?(service)
      @service = service || ''
    end

    def value
      return nil if @service.empty?
      @service.to_s
    end

    private

    def valid_service?(service)
      return true if service.nil? || service.empty?
      VALID_SERVICES.include?(service.to_s)
    end
  end
end
