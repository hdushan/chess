$: << './lib'

require 'simplecov'
SimpleCov.start do
  add_filter '/_spec/'
end
 
require 'rubygems'
require 'rspec'