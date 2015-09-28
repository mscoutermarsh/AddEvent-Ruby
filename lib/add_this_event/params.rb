require 'add_this_event/service'
require 'forwardable'
require 'ostruct'

module AddThisEvent
  # Takes in a hash of parameters and formats them for use with the AddThisEvent API
  class Params
    extend Forwardable

    # Available parameters. Full docs: https://addthisevent.com/api/
    KEYS = %i(alarm all_day_event client date_format description end endext endtime location
              organizer organizer_email reference service start startext starttime template timezone title).freeze

    VALID_SERVICES = %w(outlook google appleical outlookcom yahoo).freeze
    DATE_FORMAT = 'MM/DD/YYYY'.freeze

    attr_reader :params

    delegate %i(title organizer description location organizer_email template reference alarm) => :params

    ##
    # @param [Hash] params
    #
    # @return [AddThisEvent::Params]
    #
    # @api public
    def initialize(params)
      @params = OpenStruct.new(params)
    end

    ##
    # Returns a hash with only valid params for the AddThisEvent API
    #
    # @return [Hash]
    #
    # @api public
    def to_h
      KEYS.each_with_object({}) { |key, output| output[key] = send(key) }
    end

    private

    # The AddThisEvent API client_id
    def client
      return params.client_id unless params.client_id.nil?
      fail(ArgumentError, 'client_id must not be nil. ' \
           'Visit https://addthisevent.com/account/ to get your client_id (License Code)')
    end

    # Event start date. Mandatory. Format: "MM/DD/YYYY"
    def start
      params.starts_at.strftime('%m/%d/%Y')
    end

    # Event end date. Mandatory. Format: "MM/DD/YYYY"
    def end
      params.ends_at.strftime('%m/%d/%Y')
    end

    # Event start time. Mandatory. Format: "HH/MM/SS"
    def starttime
      params.starts_at.strftime('%I:%M:%S')
    end

    # Event end time. Mandatory. Format: "HH/MM/SS"
    def endtime
      params.ends_at.strftime('%I:%M:%S')
    end

    # AM or PM
    def startext
      params.starts_at.strftime('%p')
    end

    def endext
      params.ends_at.strftime('%p')
    end

    def date_format
      DATE_FORMAT
    end

    def service
      AddThisEvent::Service.new(params[:service]).value
    end

    def timezone
      params.starts_at.zone
    end

    def all_day_event
      params.all_day_event == true
    end
  end
end
