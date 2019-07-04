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
      if params[:list] == nil
        redirect "/products/#{params[:id]}"
      else
        @wishlist = Wishlist.find(params[:list][:wishlists_ids])
        if @wishlist.products.find(params[:id]) != nil
          redirect "/wishlists/#{@wishlist.id}"
        else
          @wishlist.products << @product
          redirect "/wishlists/#{@wishlist.id}"
        end
      end
    else
      redirect '/login'
    end
  end

end
