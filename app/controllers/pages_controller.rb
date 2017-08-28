class PagesController < ApplicationController
  def home
  end
    
  def users
      @users = User.all
  end
    
  def show
      @user = User.find(params[:id])
      @pictures = @user.pictures
  end
end
