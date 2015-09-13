require 'addressable/template'
require 'add_this_event/params'

module AddThisEvent
  class Url
    # Create a new AddThisEvent URL!
    #

    URL_TEMPLATE = Addressable::Template.new("https://addevent.to/dir/{?#{AddThisEvent::Params::KEYS.join(',')}}")

    ##
    #  Initialize a new Event.
    #
    #  Arguments:
    #    title: (String)
    #    starts_at: (DateTime)
    #    ends_at: (DateTime)
    #
    #
    def initialize(title:, starts_at:, ends_at:, options: {})
      @title = title
      @starts_at = starts_at
      @ends_at = ends_at
      @params = AddThisEvent::Params.new(options.merge(title: title,
                                                       starts_at: starts_at,
                                                       ends_at: ends_at))
    end

    def to_s
      URL_TEMPLATE.expand(@params.to_h).to_s
    end
  end
end
