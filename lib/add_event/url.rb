require 'addressable/template'
require 'add_event/params'

##
# An AddEvent::Url that conforms to the Direct URL API (https://addthisevent.com/api)
module AddEvent
  class Url
    URL_TEMPLATE = Addressable::Template.new("https://addevent.to/dir/{?#{Params::KEYS.join(',')}}").freeze

    # add something here
    ##
    # Creates an AddEvent URL
    #
    # @param [String] title
    # @param [DateTime] starts_at
    #   The <code>DateTime</code> of when the event begins.
    # @param [DateTime] ends_at
    #   The <code>DateTime</code> of when the event ends.
    # @param [Hash] options
    #
    # @return [AddEvent::Url]
    #
    # @api public
    def initialize(title:, starts_at:, ends_at:, options: {})
      @title = title
      @starts_at = starts_at
      @ends_at = ends_at
      @params = AddEvent::Params.new(options.merge(title: title,
                                                   starts_at: starts_at,
                                                   ends_at: ends_at))
    end

    ##
    # Returns the AddEvent URL as a string
    # @return [String]
    #
    # @api public
    def to_s
      URL_TEMPLATE.expand(@params.to_h).to_s
    end
  end
end
