require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    get '/pirates' do
      @pirates = Pirate.all

      erb :'pirates/show'
    end

    post '/pirates' do
      p = params[:pirate]
      @pirate = Pirate.new(p[:name], p[:weight], p[:height])
      params[:pirate][:ships].each do |shipInfo|
      Ship.new(shipInfo)
      end
      @ship1 = Ship.all[0]
      @ship2 = Ship.all[1]
      erb :'pirates/show'
    end
  end
end
