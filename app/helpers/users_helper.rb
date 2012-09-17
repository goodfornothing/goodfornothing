module UsersHelper

  def time_active(user)
    years = (Time.now.year) - (user.created_at.year)
    if years < 1
      months = Time.now.month - user.created_at.month
      if months < 1
        nil
      else
        "been a member for #{pluralize(months,'month')}"
      end
    else
      "been a member for #{pluralize(years,'year')}"
    end
  end

end