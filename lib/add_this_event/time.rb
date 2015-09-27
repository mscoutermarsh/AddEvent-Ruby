require 'tzinfo'

##
# AddThisEvent requires the timezone to be in City format (offset is not allowed).
#   Guessing the timezone city from the Time object won't always be accurate.
#   So instead, we convert all times to a standard zone.
#   The zone we send to the API doesn't really matter, since it will be converted to local time
#   when added to the users calendar. We have to standardize on something.
module AddThisEvent::Time
  TIMEZONE_NAME = 'America/New_York'
  TIMEZONE = TZInfo::Timezone.get(TIMEZONE_NAME)

  def self.standardize_timezone(time)
    binding.pry
    TIMEZONE.utc_to_local(time.utc)
  end
end
