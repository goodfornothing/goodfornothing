# -*- encoding: utf-8 -*-
# stub: stripe 1.10.2 ruby lib

Gem::Specification.new do |s|
  s.name = "stripe".freeze
  s.version = "1.10.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Ross Boucher".freeze, "Greg Brockman".freeze]
  s.date = "2024-02-28"
  s.description = "Stripe is the easiest way to accept payments online.  See https://stripe.com for details.".freeze
  s.email = ["boucher@stripe.com".freeze, "gdb@stripe.com".freeze]
  s.executables = ["stripe-console".freeze]
  s.files = [".gitignore".freeze, ".travis.yml".freeze, "CONTRIBUTORS".freeze, "Gemfile".freeze, "History.txt".freeze, "LICENSE".freeze, "README.rdoc".freeze, "Rakefile".freeze, "VERSION".freeze, "bin/stripe-console".freeze, "gemfiles/default-with-activesupport.gemfile".freeze, "gemfiles/json.gemfile".freeze, "gemfiles/yajl.gemfile".freeze, "lib/data/ca-certificates.crt".freeze, "lib/stripe.rb".freeze, "lib/stripe/account.rb".freeze, "lib/stripe/api_operations/create.rb".freeze, "lib/stripe/api_operations/delete.rb".freeze, "lib/stripe/api_operations/list.rb".freeze, "lib/stripe/api_operations/update.rb".freeze, "lib/stripe/api_resource.rb".freeze, "lib/stripe/application_fee.rb".freeze, "lib/stripe/balance.rb".freeze, "lib/stripe/balance_transaction.rb".freeze, "lib/stripe/card.rb".freeze, "lib/stripe/charge.rb".freeze, "lib/stripe/coupon.rb".freeze, "lib/stripe/customer.rb".freeze, "lib/stripe/errors/api_connection_error.rb".freeze, "lib/stripe/errors/api_error.rb".freeze, "lib/stripe/errors/authentication_error.rb".freeze, "lib/stripe/errors/card_error.rb".freeze, "lib/stripe/errors/invalid_request_error.rb".freeze, "lib/stripe/errors/stripe_error.rb".freeze, "lib/stripe/event.rb".freeze, "lib/stripe/invoice.rb".freeze, "lib/stripe/invoice_item.rb".freeze, "lib/stripe/list_object.rb".freeze, "lib/stripe/plan.rb".freeze, "lib/stripe/recipient.rb".freeze, "lib/stripe/singleton_api_resource.rb".freeze, "lib/stripe/stripe_object.rb".freeze, "lib/stripe/subscription.rb".freeze, "lib/stripe/token.rb".freeze, "lib/stripe/transfer.rb".freeze, "lib/stripe/util.rb".freeze, "lib/stripe/version.rb".freeze, "stripe.gemspec".freeze, "test/stripe/account_test.rb".freeze, "test/stripe/api_resource_test.rb".freeze, "test/stripe/application_fee_test.rb".freeze, "test/stripe/charge_test.rb".freeze, "test/stripe/coupon_test.rb".freeze, "test/stripe/customer_test.rb".freeze, "test/stripe/invoice_test.rb".freeze, "test/stripe/list_object_test.rb".freeze, "test/stripe/metadata_test.rb".freeze, "test/stripe/stripe_object_test.rb".freeze, "test/stripe/subscription_test.rb".freeze, "test/stripe/util_test.rb".freeze, "test/test_helper.rb".freeze]
  s.homepage = "https://stripe.com/api".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.3.26".freeze
  s.summary = "Ruby bindings for the Stripe API".freeze
  s.test_files = ["test/stripe/account_test.rb".freeze, "test/stripe/api_resource_test.rb".freeze, "test/stripe/application_fee_test.rb".freeze, "test/stripe/charge_test.rb".freeze, "test/stripe/coupon_test.rb".freeze, "test/stripe/customer_test.rb".freeze, "test/stripe/invoice_test.rb".freeze, "test/stripe/list_object_test.rb".freeze, "test/stripe/metadata_test.rb".freeze, "test/stripe/stripe_object_test.rb".freeze, "test/stripe/subscription_test.rb".freeze, "test/stripe/util_test.rb".freeze, "test/test_helper.rb".freeze]

  s.installed_by_version = "3.3.26" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<rest-client>.freeze, ["~> 1.4"])
    s.add_runtime_dependency(%q<mime-types>.freeze, ["~> 1.25"])
    s.add_runtime_dependency(%q<json>.freeze, ["~> 1.8.1"])
    s.add_development_dependency(%q<mocha>.freeze, ["~> 0.13.2"])
    s.add_development_dependency(%q<shoulda>.freeze, ["~> 3.4.0"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rest-client>.freeze, ["~> 1.4"])
    s.add_dependency(%q<mime-types>.freeze, ["~> 1.25"])
    s.add_dependency(%q<json>.freeze, ["~> 1.8.1"])
    s.add_dependency(%q<mocha>.freeze, ["~> 0.13.2"])
    s.add_dependency(%q<shoulda>.freeze, ["~> 3.4.0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
