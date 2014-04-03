require 'spec_helper'

describe 'creation of .aliasit' do
  include FakeFS::SpecHelpers::All
  FakeFS.activate!

  it 'should create a .aliasit file' do
    FakeFS::FileSystem.clone("#{Dir.home}/.zshrc")
    stub_shell
    Aliasit.create_aliasit_file
    expect(File.exist?("#{Dir.home}/.aliasit")).to be_true
  end

  context 'source ~/.aliasit' do
    it 'should add it to ~/.zshrc if the shell is zsh' do
      FakeFS::FileSystem.clone("#{Dir.home}/.zshrc")
      stub_shell
      Aliasit.create_aliasit_file
      expect(File.read("#{Dir.home}/.zshrc")).to include("[[ -f ~/.aliasit ]] && source ~/.aliasit")
    end
    it 'should add it to ~/.bash_profile if the shell is bash' do
      FakeFS::FileSystem.clone("#{Dir.home}/.bash_profile")
      stub_shell('-bash')
      Aliasit.create_aliasit_file
      expect(File.read("#{Dir.home}/.bash_profile")).to include("[[ -f ~/.aliasit ]] && source ~/.aliasit")
    end
  end
end
