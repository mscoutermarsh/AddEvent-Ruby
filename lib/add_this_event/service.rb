##
# Validates and provides a Service value for the AddThisEvent API
module AddThisEvent
  class Service
    VALID_SERVICES = %w(appleical google outlook outlookcom yahoo).freeze

    ##
    # @param [String, Symbol] service
    #   The type of service to create the event for
    #
    # @return [AddThisEvent::Service]
    #
    # @api public
    def initialize(service)
      fail(ArgumentError, "service must set to #{VALID_SERVICES.join(', ')} or nil") unless valid_service?(service)
      @service = service || ''
    end

    ##
    # Returns a proper service value for the API
    # either a string if a valid service was passed, or nil.
    #
    # @return [String]
    #
    # @api public
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
