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

  post '/wishlists' do
    @user = current_user
    if params[:name] != ""
      @user.wishlists << Wishlist.create(name: params[:name])
      @user.save
      redirect '/wishlists'
    else
      redirect '/wishlist/new'
    end
  end

  get '/wishlists/:id' do
    if logged_in?
      @user = current_user
      @wishlist = @user.wishlists.find(params[:id])
      erb :'/wishlists/products'
    else
      redirect '/login'
    end
  end

end
