$: << './lib'

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end
 
require 'rubygems'
require 'rspec'

RSpec::Expectations.configuration.warn_about_potential_false_positives = false