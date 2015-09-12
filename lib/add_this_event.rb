require 'add_this_event/version'
require 'add_this_event/url'
require 'date'
require 'helpers/configuration'

module AddThisEvent
  extend Configuration

  define_setting :client_id

  def self.url(title:, starts_at:, ends_at:, options: {})
    options = {client_id: client_id}.merge(options)

    Url.new(title: title, starts_at: starts_at, ends_at: ends_at,
            options: options).to_s
  end
end
