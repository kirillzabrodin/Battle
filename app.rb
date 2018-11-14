require "sinatra/base"
require './lib/game'
require './lib/player'

class Battle < Sinatra::Base

  before do
    @game = Game.instance
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post "/names" do
    player_1 = Player.new(params[:p1])
    player_2 = Player.new(params[:p2])
    @game = Game.create(player_1, player_2)
    redirect "/play"
  end

  get "/play" do
    erb :play
  end

  post "/attack" do
    @game.attack(@game.opponent_of(@game.current_turn))
    if @game.game_over?
      redirect '/game-over'
    else
      redirect '/attack'
    end
  end

  get "/attack" do
    erb :attack
  end

  get "/game-over" do
    erb :game_over
  end

  post '/switch-turns' do
    @game.switch_turns
    redirect('/play')
  end

  run! if app_file == $0
end
