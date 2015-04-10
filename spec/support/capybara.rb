require 'capybara/rails'
require 'capybara/rspec'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

#caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--start-maximized" ]})
#$driver = Capybara::Selenium::Driver.new(app, {:browser => :chrome, :desired_capabilities => caps})

#Capybara.asset_host = 'http://localhost:3000'


Capybara.configure do |config|
     #config.run_server = false
     #config.app_host = 'http://localhost:3000'
     Capybara.current_driver = :selenium
     Capybara.default_driver = :selenium

end

#To ask capybara to use chrome, add this here or into test_helper.rb:
#Capybara.register_driver :selenium do |app|
#  Capybara::Selenium::Driver.new(app, :browser => :chrome)
#end

