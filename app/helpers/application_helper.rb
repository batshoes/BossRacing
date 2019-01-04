module ApplicationHelper
  def challenge_title(challenge)
    "#{challenge.challenger} v #{challenge.challengee}"
  end

  def parsed_time
    "%H:%M"
  end

  def parsed_time_and_date
    "%H:%M - %e %b %Y"
  end

end
