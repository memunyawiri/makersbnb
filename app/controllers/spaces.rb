# Controller for spaces path
class MakersBnB < Sinatra::Base

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end

  post '/spaces' do
    session[:space_id] = params[:space_id]
    redirect '/bookings'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces/new' do
    space = Space.new(name: params[:name], description: params[:description],
                 price_per_night: params[:price_per_night],
                 available_from: params[:available_from],
                 available_to: params[:available_to])
    space.user = current_user
    space.save
    redirect '/spaces'
  end
end
