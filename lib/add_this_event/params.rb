require 'add_this_event/service'
require 'add_this_event/time'
require 'forwardable'
require 'ostruct'

module AddThisEvent
  class Params
    extend Forwardable

    # Available parameters. Full docs: https://addthisevent.com/api/
    KEYS = %i(alarm all_day_event client date_format description end endext endtime location
              organizer organizer_email reference service start startext starttime template timezone title)

    VALID_SERVICES = %w(outlook google appleical outlookcom yahoo)
    DATE_FORMAT = 'MM/DD/YYYY'

    attr_reader :params

    delegate %i(title organizer description location organizer_email template reference alarm) => :params

    def initialize(params)
      params[:starts_at] = AddThisEvent::Time.standardize_time(params[:starts_at])
      params[:ends_at] = AddThisEvent::Time.standardize_time(params[:ends_at])

      @params = OpenStruct.new(params)
    end

    def to_h
      KEYS.each_with_object({}) { |key, output| output[key] = send(key) }
    end

    private

    def standarize_time
    end

    def client
      return params.client_id unless params.client_id.nil?
      fail(ArgumentError, 'client_id must not be nil. Visit https://addthisevent.com/account/ to get your client_id (License Code)')
    end

    # Event start date. Mandatory. Format: "MM/DD/YYYY"
    def start
      params.starts_at.strftime('%m/%d/%Y')
    end

    def end
      params.ends_at.strftime('%m/%d/%Y')
    end

    # Event start time. Mandatory. Format: "HH/MM/SS"
    def starttime
      params.starts_at.strftime('%I:%M:%S')
    end

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
      'America/New_York'
    end

    def all_day_event
      params.all_day_event == true
    end
  end
end
