Time::DATE_FORMATS[:article] = lambda { |time| time.strftime( "%A the #{time.day.ordinalize} of %B %Y") }
Time::DATE_FORMATS[:ical] = lambda { |time| time.strftime( "%d-%m-%Y %H:%M:00") }