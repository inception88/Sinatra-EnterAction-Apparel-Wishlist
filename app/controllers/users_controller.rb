class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.create(params[:user])
    binding.pry
    redirect '/wishlists'
  end

  get '/users' do
    erb :'users/show'
  end
end
