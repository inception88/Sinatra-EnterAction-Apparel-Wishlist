class ProductsController < ApplicationController

  get '/products' do
    erb :'/products/show'
  end

  get '/products/:id' do
    if logged_in?
      @user = current_user
      @product = Product.find_by(id: params[:id])
      if @product != nil
        erb :'/products/detail'
      else
        redirect '/products'
      end
    else
      redirect '/login'
    end
  end

  patch '/products/:id' do
    if logged_in?
      @user = current_user
      @product = Product.find_by(id: params[:id])
      if params[:list] == nil
        redirect "/products/#{params[:id]}"
      else
        @wishlist = Wishlist.find(params[:list][:wishlists_ids])
        if !@wishlist.products.include?(@product)
          @wishlist.products << @product
        end
        redirect "/wishlists/#{@wishlist.id}"
      end
    else
      redirect '/login'
    end
  end

end
