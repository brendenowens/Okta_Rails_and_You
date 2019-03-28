class CatsController < ApplicationController
    before_action :user_is_logged_in?
    # before_action :correct_user?, :except => [:index]
  
    def index
        response = HTTParty.get('http://okta-api:8080/pets/v1/cats', {headers: {"X-Token"=> session[:oktastate][:credentials][:token]}})
        if response.code == 200
            @cats = JSON.parse(response.body)
        else
            @cats = []
        end
    end
  
  end
  