class SearchController < ApplicationController

  def show
    @user = User.find_by(username: search_params["username"])

    if @user != nil
      @shouts = @user.shouts
      redirect_to @user
    else
      @possible_matches = User.where("username ilike ?", "%#{search_params["username"]}%")
      if @possible_matches[0] == nil
        flash[:error] = "Sorry! username:" + search_params["username"] + " could not be located!"
      else
         
       flash[:error] = "Did you mean #{@possible_matches[0].username}?"
      end
      redirect_to :dashboard
    end

  end 
  def search_params
    params.require(:search).permit(:username)
  end
end
