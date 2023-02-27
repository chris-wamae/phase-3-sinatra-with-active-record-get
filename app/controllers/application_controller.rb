class ApplicationController < Sinatra::Base
 set :default_content_type, "application/json" 
  get '/' do
    { message: "Hello world" }.to_json
  end

  get "/games" do 
    games = Game.all
    games.to_json
  end

  get "/games/:id" do
   single_game = Game.find(params[:id])
   single_game.to_json(include: { reviews: { include: :user } })
  end
  

end
