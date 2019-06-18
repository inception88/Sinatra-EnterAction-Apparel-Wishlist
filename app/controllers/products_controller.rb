class ProductsController < ApplicationController

  get '/products' do
    erb :'/products/show'
  end

  get '/products/:id' do
    if logged_in?
      @user = current_user
      @product = Product.find(params[:id])
      erb :'/products/detail'
    else
      redirect '/login'
    end
  end

  patch '/products/:id' do
    if logged_in?
      @user = current_user
      @product = Product.find(params[:id])
      @wishlist = Wishlist.find(params[:list][:wishlists_ids])
      @wishlist.products << @product
      redirect "/wishlists/#{@wishlist.id}"
    else
      redirect '/login'
    end
  end

end
