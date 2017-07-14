require_relative '../config/environment.rb'
require_all 'app'

def reload
  load 'config/environment.rb'
end

#require_relative '../dev/tests.rb'

Pry.start
