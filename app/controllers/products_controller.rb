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

end
