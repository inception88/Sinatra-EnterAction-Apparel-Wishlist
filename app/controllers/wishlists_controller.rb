class WishlistsController < ApplicationController

  get '/wishlists' do
    if logged_in?
      @user = current_user
      erb :'/wishlists/show'
    else
      redirect '/login'
    end
  end

  get '/wishlists/new' do
    if logged_in?
      erb :'/wishlists/new'
    else
      redirect '/login'
    end
  end

end
