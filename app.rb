require "sinatra/base"

class Battle < Sinatra::Base
  get '/' do
    "Hello Battlers!"
  end
end
