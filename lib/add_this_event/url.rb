require 'addressable/template'
require 'add_this_event/params'

class AddThisEvent::Url
  # Create a new AddThisEvent URL!
  #

  # URL_TEMPLATE = Addressable::Template.new("https://addevent.to/dir/{?#{QUERY_PARAMS.join(',')}}")

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
  end

  def to_s
    # TODO
    # URL_TEMPLATE.expand
  end
end
