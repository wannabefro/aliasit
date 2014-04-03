require 'bundler/setup'
Bundler.setup
require 'aliasit'
require 'fakefs/spec_helpers'
require 'pry'

module Helpers
  def stub_input(input, optional_input = nil)
    Kernel.stub(:gets).and_return(input, (optional_input ? optional_input : input))
  end
end

RSpec.configure do |conf|
  conf.include(Helpers)
end
