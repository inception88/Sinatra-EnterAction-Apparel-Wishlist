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

  def current_user
    User.find(session[:id])
  end
end
