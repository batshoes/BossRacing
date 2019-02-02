module ApplicationHelper
  def challenge_title(challenge)
    "#{challenge.challenger_name} v #{challenge.challengee_name}"
  end

  def parsed_time
    "%H:%M"
  end

  def parsed_time_and_date
    "%H:%M - %e %b %Y"
  end

end
