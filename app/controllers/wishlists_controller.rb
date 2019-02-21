class WishlistsController < ApplicationController

  get '/wishlists' do
    erb :'/wishlists/show'
  end
end
