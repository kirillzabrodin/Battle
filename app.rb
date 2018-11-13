require "sinatra/base"

class Battle < Sinatra::Base
  get '/' do
    "Hello from MyApp!"
  end
end
