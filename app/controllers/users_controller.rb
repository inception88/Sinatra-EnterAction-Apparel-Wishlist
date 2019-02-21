class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @user = User.create(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect '/welcome'
    else
      redirect '/signup'
    end
  end

  get '/welcome' do
    binding.pry
    @user = current_user
    erb :'users/welcome'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
