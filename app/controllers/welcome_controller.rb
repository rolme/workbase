class WelcomeController < ApplicationController
#  def index
#  end
    def index
       render :layout => 'landing' 
    end
end
