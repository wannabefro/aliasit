require 'spec_helper'

describe 'creation of .aliasit' do
  include FakeFS::SpecHelpers::All
  FakeFS.activate!
  FakeFS::FileSystem.clone("#{Dir.home}/.zshrc")

  it 'should create a .aliasit file if none exists' do
    Aliasit.create_aliasit_file
    expect(File.exist?("#{Dir.home}/.aliasit")).to be_true
  end

  it 'should not create a .aliasit file if it already exists' do
    File.write("#{Dir.home}/.aliasit", 'hello world')
    Aliasit.create_aliasit_file
    expect(File.read("#{Dir.home}/.aliasit")).to include("hello world")
  end
end
