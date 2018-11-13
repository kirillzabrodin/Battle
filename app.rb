require "sinatra/base"
require "./lib/player"

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post "/names" do
    $player_1 = Player.new(params[:p1])
    $player_2 = Player.new(params[:p2])
    redirect "/play"
  end

  get "/play" do
    @p1 = $player_1
    @p2 = $player_2
    erb :play
  end

  get "/attack" do

    @p1 = $player_1
    @p2 = $player_2
    Game.new.attack(@p2)
    erb :attack
  end

  run! if app_file == $0
end
