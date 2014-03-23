# load stripe config
yaml_file = File.join(Rails.root, "config", "stripe.yml")
stripe_info = YAML.load_file(yaml_file)[Rails.env.to_s]
ENV['STRIPE_SECRET_KEY'] = stripe_info['secret_key']
ENV['STRIPE_PUBLISHABLE_KEY'] = stripe_info['publishable_key']
Stripe.api_key = ENV['STRIPE_SECRET_KEY']