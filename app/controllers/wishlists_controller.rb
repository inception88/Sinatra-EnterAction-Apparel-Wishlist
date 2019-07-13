class WishlistsController < ApplicationController

  get '/wishlists' do
    redirect_if_not_logged_in
    @user = current_user
    erb :'/wishlists/show'
  end

  get '/wishlists/new' do
    redirect_if_not_logged_in
    erb :'/wishlists/new'
  end

  post '/wishlists' do
    @user = current_user
    if params[:name] != ""
      @user.wishlists << Wishlist.create(name: params[:name])
      @user.save
      redirect '/wishlists'
    else
      redirect '/wishlists/new'
    end
  end

  get '/wishlists/:id' do
    redirect_if_not_logged_in
    @user = current_user
    @wishlist = @user.wishlists.find_by(id: params[:id])
    redirect_if_no_wishlist
    erb :'/wishlists/wishlist_products'
  end

  patch '/wishlists/:id/:product' do
    @user = current_user
    @wishlist = @user.wishlists.find_by(id: params[:id])
    if @wishlist != nil
      if params[:product] != nil
        @wishlist.products.delete(Product.find(params[:product]))
        @wishlist.save
      end
    else
      redirect '/wishlists'
    end
    redirect "/wishlists/#{@wishlist.id}"
  end

  delete '/wishlists/:id' do
    @user = current_user
    @wishlist = Wishlist.find_by(id: params[:id])
    if @user.wishlists.include?(@wishlist)
      @wishlist.delete
    end
      redirect "/wishlists"
  end
end
