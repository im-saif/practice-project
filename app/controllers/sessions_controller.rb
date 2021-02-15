class SessionsController < ApplicationController
    def new
    end
  
    def create
        user = User.find_by_email(params[:email])
    
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/', :notice => "Signed in as #{current_user.username}"
        else
   
        redirect_to '/login', :alert => "Invalid email or password"
        end
    end
  
    def destroy
        session[:user_id] = nil
        redirect_to '/', :notice => "Signed Out Successfully"

    end
  
end
