require "sinatra/base"

class Battle < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  post "/names" do
    session[:p1] = params[:p1]
    session[:p2] = params[:p2]
    session[:p1_hp] = 60
    session[:p2_hp] = 60
    redirect "/play"
  end

  get "/play" do
    @p1 = session[:p1]
    @p2 = session[:p2]
    @p1_hp = session[:p1_hp]
    @p2_hp = session[:p2_hp]
    erb :play
  end

  get "/attack" do
    @p1 = session[:p1]
    @p2 = session[:p2]
    erb :attack
  end

  run! if app_file == $0
end
