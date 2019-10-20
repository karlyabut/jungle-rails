class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['ENV_ADMIN_USERNAME'], password: ENV['ENV_ADMIN_PASSWORD']
  def show
    @products = Product.order(:category_id).all
end
