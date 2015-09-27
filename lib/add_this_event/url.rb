require 'addressable/template'
require 'add_this_event/params'

##
# An AddThisEvent::Url that conforms to the Direct URL API (https://addthisevent.com/api)
module AddThisEvent
  class Url
    URL_TEMPLATE = Addressable::Template.new("https://addevent.to/dir/{?#{AddThisEvent::Params::KEYS.join(',')}}").freeze

    ##
    # Creates an AddThisEvent URL
    #
    # @param [String] title
    # @param [DateTime] starts_at
    #   The <code>DateTime</code> of when the event begins.
    # @param [DateTime] ends_at
    #   The <code>DateTime</code> of when the event ends.
    # @param [Hash] options
    #
    # @return [AddThisEvent::Url]
    #
    # @api public
    def initialize(title:, starts_at:, ends_at:, options: {})
      @title = title
      @starts_at = starts_at
      @ends_at = ends_at
      @params = AddThisEvent::Params.new(options.merge(title: title,
                                                       starts_at: starts_at,
                                                       ends_at: ends_at))
    end

    ##
    # Returns the AddThisEvent URL as a string
    # @return [String]
    #
    # @api public
    def to_s
      URL_TEMPLATE.expand(@params.to_h).to_s
    end
  end
end
