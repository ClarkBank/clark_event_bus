$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

Bundler.require(:default, 'test')

require 'rubygems'
require 'bundler'
require 'clark/event_bus'

RSpec.configure do |config|
  config.order = :random

  config.expect_with(:rspec) do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with(:rspec) do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
    mocks.verify_doubled_constant_names = true
  end
end
