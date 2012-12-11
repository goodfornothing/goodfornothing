module UsersHelper

  def time_active(user)
    years = (Time.now.year) - (user.created_at.year)
    if years < 1
      months = Time.now.month - user.created_at.month
      if months < 1
       	"for a few days"
      else
        "for #{pluralize(months,'month')}"
      end
    else
      "for #{pluralize(years,'year')}"
    end
  end

end