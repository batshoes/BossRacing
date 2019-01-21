module ApplicationHelper
  def challenge_title(challenge)
    "#{challenge.challenger.username} v #{challenge.challengee.username}"
  end

  def parsed_time
    "%H:%M"
  end

  def parsed_time_and_date
    "%H:%M - %e %b %Y"
  end

end
