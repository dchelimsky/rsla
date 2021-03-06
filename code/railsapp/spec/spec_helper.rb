require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  require 'spec/autorun'
  require 'spec/rails'

  require 'webrat/integrations/rspec-rails'

  Dir[File.expand_path('../support/**/*.rb', __FILE__)].each {|f| require f}

  Spec::Runner.configure do |config|
    config.use_transactional_fixtures = true
    config.use_instantiated_fixtures  = false
    config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  end
end

Spork.each_run do
end
