class ActiveRecord::Base     
  def check_url_scheme
    unless self.url.nil? || self.url.blank? || (/^(http(?:s)?:\/\/){1}(.)+$/.match(self.url))
      self.url = "http://#{self.url}"
    end
  end
end