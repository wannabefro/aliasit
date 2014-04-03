module Aliasit
  class << self
    def create_aliasit_file
      if !(File.exist?("#{Dir.home}/.aliasit"))
        File.open("#{Dir.home}/.aliasit", 'w')
      end
    end
  end
end
