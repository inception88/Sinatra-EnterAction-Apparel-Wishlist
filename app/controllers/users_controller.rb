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

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect '/welcome'
    end
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect '/wishlists'
    else
      redirect '/login'
    end
  end

  get '/welcome' do
    @user = current_user
    erb :'users/welcome'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
