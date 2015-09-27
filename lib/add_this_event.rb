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
  # @param [String] title The title of the event (this is what users will see on their calendar)
  # @param [DateTime] starts_at
  #   The <code>DateTime</code> of when the event begins.
  # @param [DateTime] ends_at
  #   The <code>DateTime</code> of when the event ends.
  # @param [Hash] options Optional parameters for creating the event.
  # @option options [String] :client_id The API client id (https://addthisevent.com/account)
  # @option options [Symbol, String] :service Invite format: [:outlook, :google, :appleical, :outlookcom, :yahoo]
  # @option options [Integer] :alarm Set a reminder alarm before the event. Integer in # of minutes.
  # @option options [String] :organizer Event Organizer's Name
  # @option options [String] :organizer_email Recipient email
  # @option options [String] :description Event description (Max 300 chars recommended)
  # @option options [String] :location Location of the Event. Ex: San Francisco, CA
  # @option options [String] :reference Tracking parameter for analytics. Ex: "iPhone" or "Newsletter Oct 2016"
  # @option options [String] :template ID of a AddThisEvent template. Uses the default template if not defined.
  # @option options [Boolean] :all_day_event All day event. True or False
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
