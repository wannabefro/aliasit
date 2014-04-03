module Aliasit
  class << self
    def create_aliasit_file
      File.open("#{Dir.home}/.aliasit", 'w')
      shell_profile = get_shell_profile
      File.open("#{Dir.home}/#{shell_profile}", "a") {|file| file.puts "[[ -f ~/.aliasit ]] && source ~/.aliasit"}
    end

    def get_shell_profile
      output = system('ps -p $$')
      if output.include?('zsh')
        '.zshrc'
      elsif output.include?('bash')
        '.bash_profile'
      end
    end
  end
end
