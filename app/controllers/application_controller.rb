require "./config/environment"

class ApplicationController < Sinatra::Base
  # register Sinatra::ActiveRecordExtension

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  helpers do
    def current_user
      @user ||= User.find(session[:id])
    end

    def logged_in?
      session[:id] != nil
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/login'
      end
    end

    def redirect_if_no_wishlist
      if @wishlist == nil
        redirect '/wishlists'
      end
    end
  end
end
