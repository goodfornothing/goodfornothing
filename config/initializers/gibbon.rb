yaml_file = File.join(Rails.root, "config", "mailchimp.yml")
mailchimp_info = YAML.load_file(yaml_file)[Rails.env.to_s]
ENV['MC_API_KEY'] = mailchimp_info['api_key']
ENV['MC_LIST_ID'] = mailchimp_info['list_id']