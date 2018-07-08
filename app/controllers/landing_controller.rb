class LandingController < ApplicationController
    def callback
        current_user
        @client = Instagram.client(:access_token => session[:access_token])
        @user = @client.user
    end

    def destroy
        session[:access_token] = nil
        flash[:success] = "You have Logged out."
        redirect_to root_path
    end
end
