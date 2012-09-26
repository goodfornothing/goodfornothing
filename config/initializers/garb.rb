yaml_file = File.join(Rails.root, "config", "garb.yml")
ga_info = YAML.load_file(yaml_file)[Rails.env.to_s]

Garb::Session.login(ga_info['username'], ga_info["password"])

class Newvisits
  extend Garb::Model
  metrics :newVisits
end