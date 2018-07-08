class LandingController < ApplicationController
    def callback
        # byebug
        # unless session[:access_token] == nil
        #     response = Instagram.get_access_token(params[:code], redirect_uri: ENV['REDIRECT_URI'])
        #     session[:access_token] = response.access_token
        #     flash[:success] = "Welcome to Pedro's Showoff Test - Instagram Authentication"
        # end
        current_user
        @client = Instagram.client(:access_token => session[:access_token])
        @user = @client.user
        flash[:success] = "Welcome to #{@user.username} Showoff Test - Instagram Authentication"
    end

    # def destroy
    #     session[:access_token] = nil
    #     flash[:success] = "You have Logged out."
    #     redirect_to root_path
    # end
end
