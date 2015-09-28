require 'add_this_event/version'
require 'add_this_event/url'
require 'date'
require 'helpers/configuration'

##
# Ruby Client for the AddThisEvent API. Makes it easy to generate event invites from Ruby.
module AddThisEvent
  extend Configuration

  ##
  # Set the API client ID. (https://addthisevent.com/account)
  #
  # == Usage
  #  # config/initializers/add_this_event.rb
  #  AddThisEvent.configuration do |config|
  #    # Your Client ID (License code) is available here: https://addthisevent.com/account/
  #    config.client_id = 'your_id_goes_here'
  #  end
  define_setting :client_id

  ##
  # Creates an AddThisEvent URL
  #
  # == Usage
  #  party_starts = DateTime.new(2016, 10, 2, 18, 0, 0, '+7')
  #  party_ends = DateTime.new(2016, 10, 3, 3, 0, 0, '+7')
  #
  #  event_options = {
  #    service: :google, # or 'google' works too!
  #    organizer: 'Mike',
  #    organizer_email: 'coutermarsh.mike@gmail.com',
  #    alert: 15, # set alarm for 15 minutes before the party starts
  #    description: "A little get together to celebrate DHH's birthday. BYORG (Bring your own ruby gems)",
  #    location: "Ruby Bar, San Francisco CA"
  #  }
  #
  #  url = AddThisEvent.url(title: "DHH's Birthday Bash", starts_at: party_starts,
  #                         ends_at: party_ends, options: event_options)
  #
  # == Time Zones
  # To keep things simple, this gem converts the <code>starts_at</code> and <code>ends_at</code>
  # to UTC and sends all times to AddThisEvent as UTC. When the end user adds the event to their
  # calendar, it will automatically be converted to their local timezone.
  #
  # @overload url(title, starts_at, ends_at, options)
  #   @param [String] title The title of the event (this is what users will see on their calendar)
  #   @param [DateTime] starts_at
  #     The <code>DateTime</code> of when the event begins.
  #   @param [DateTime] ends_at
  #     The <code>DateTime</code> of when the event ends.
  #   @param [Hash] options Optional parameters for creating the event.
  #   @option options [String] :client_id
  #     The API client id (https://addthisevent.com/account). Only need to include this
  #     if you did not set it using +config+.
  #   @option options [Symbol, String] :service
  #     Type of service you'd like the event generated for.
  #     Available services are <code>:outlook, :google, :appleical, :outlookcom or :yahoo.</code>
  #     May be passed as a string (<code>'outlook'</code>) or a symbol (<code>:outlook</code>)
  #   @option options [Integer] :alarm
  #     Set a reminder alarm before the event. Integer in # of minutes before the event starts.
  #   @option options [String] :organizer
  #     Event organizer's name
  #   @option options [String] :organizer_email
  #     Event organizers email
  #   @option options [String] :description
  #     Event description (Max 300 chars recommended)
  #   @option options [String] :location
  #     Location of the Event. Ex: +'San Francisco, CA'+
  #   @option options [String] :reference
  #     Tracking parameter for analytics. Ex: <code>"iPhone"</code> or <code>"Newsletter Oct 2016"</code>
  #   @option options [String] :template
  #     ID of a AddThisEvent template. Uses the default template if not defined.
  #     You can get this ID from the AddThisEvent dashboard after creating a template.
  #   @option options [Boolean] :all_day_event (false)
  #     Is it an all day event? True or False
  #
  # @return [String] AddThisEvent Direct URL
  #
  # @api public
  def self.url(title:, starts_at:, ends_at:, options: {})
    options = { client_id: client_id }.merge(options)

    Url.new(title: title, starts_at: starts_at, ends_at: ends_at,
            options: options).to_s
  end
end
