require 'bundler/setup'
Bundler.setup
require 'aliasit'
require 'fakefs/spec_helpers'
require 'pry'

module Helpers
  def stub_input(input, optional_input = nil)
    Kernel.stub(:gets).and_return(input, (optional_input ? optional_input : input))
  end

  def stub_shell(shell='-zsh')
    Aliasit.should_receive(:system).with('ps -p $$').and_return("PID TTY           TIME CMD
                                                               39786 ttys009    0:00.24 #{shell}")
  end
end

RSpec.configure do |conf|
  conf.include(Helpers)
end
