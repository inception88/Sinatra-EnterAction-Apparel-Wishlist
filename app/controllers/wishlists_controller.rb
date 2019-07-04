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
      erb :'/wishlists/wishlist_products'
    else
      redirect '/login'
    end
  end

  patch '/wishlists/:id/:product' do
    @wishlist = Wishlist.find(params[:id])
    binding.pry
    if params[:product] != nil
      @wishlist.products.delete(Product.find(params[:product]))
      @wishlist.save
    end
    redirect "/wishlists/#{@wishlist.id}"
  end

  delete '/wishlists/:id' do
    @user = current_user
    @wishlist = Wishlist.find(params[:id])
    if @user.wishlists.include?(@wishlist)
      @wishlist.delete
    end
      redirect "/wishlists"
  end
end
