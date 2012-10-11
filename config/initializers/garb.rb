yaml_file = File.join(Rails.root, "config", "garb.yml")
ga_info = YAML.load_file(yaml_file)[Rails.env.to_s]

begin 
	Garb::Session.login(ga_info['username'], ga_info["password"])
rescue
	puts "WARNING: Unable to connect to Google Analytics API."
end

class Newvisits
  extend Garb::Model
  metrics :newVisits
end