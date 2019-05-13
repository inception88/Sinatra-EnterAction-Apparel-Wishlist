class WishlistsController < ApplicationController

  get '/wishlists' do
    erb :'/wishlists/show'
  end

  get '/wishlists/new' do
    if logged_in?
      erb :'/wishlists/new'
    else
      redirect '/login'
    end
  end

end
