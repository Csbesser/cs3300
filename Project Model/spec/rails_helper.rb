
require 'simplecov'
SimpleCov.start 'rails' do

  #adds a filter for the bin directory
  add_filter '/bin/'
  
  #adds a filter for the db directory
  add_filter '/db/'

  #adds a filter for the spec directory
  add_filter '/spec/' # for rspec
end

