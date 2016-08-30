class WelcomeController < ActionController::Base
    def index
       render :layout => 'landing' 
    end
end
