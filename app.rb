require "sinatra/base"
require "player"

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post "/names" do
    $player_1 = Player.new(params[:p1])
    $player_2 = Player.new(params[:p2])
    session[:p1_hp] = 60
    session[:p2_hp] = 60
    redirect "/play"
  end

  get "/play" do
    @p1 = $player_1.name
    @p2 = $player_2.name
    @p1_hp = session[:p1_hp]
    @p2_hp = session[:p2_hp]
    erb :play
  end

  get "/attack" do
    @p1 = $player_1.name
    @p2 = $player_2.name
    erb :attack
  end

  run! if app_file == $0
end
