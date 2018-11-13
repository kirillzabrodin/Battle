require "sinatra/base"

class Battle < Sinatra::Base
  get '/' do
    erb(:index)
  end

  post "/names" do
    @p1 = params["P1:"]
    @p2 = params["P2:"]
    p @p1
    p @p2
    erb(:play)
  end

  run! if app_file == $0
end
