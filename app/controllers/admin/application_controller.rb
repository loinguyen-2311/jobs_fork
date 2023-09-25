class Admin::ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  before_action :authenticate_admin
  layout 'admin'

  def load_paginate(object)
    object.paginate(per_page: 10, page: params[:page])
  end

  def authenticate_admin
    if !request.url.include?('admin/login') && session[:token].nil?
      redirect_to '/admin/login'
    end
  end
end
