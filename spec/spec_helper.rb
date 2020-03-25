require "capybara"
require "capybara/rspec"
require "selenium-webdriver"

#####Arquivo inicial quando instalar#########
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end  
  config.mock_with :rspec do |mocks|    
    mocks.verify_partial_doubles = true
  end  
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Capybara::DSL
end

######Código para funcionamento do chromedriver ###########
Capybara.configure do |config|  #nesta parte estou dizendo que meu projeto rodará no Chrome.
  config.default_driver = :selenium_chome
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    chromeOptions: {
      args: %w[headless enable-features=NetworkService,NetworkServiceInProcess]
    }
  )
Capybara::Selenium::Driver.new app,
  browser: :chrome,
  desired_capabilities: capabilities
end

Capybara.default_driver = :headless_chrome
Capybara.javascript_driver = :headless_chrome
