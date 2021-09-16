class SessionsController < ApplicationController

    def new

    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:success] = "Has iniciado sesión correctamente."
          redirect_to user_path(user)
        else
          flash.now[:danger] = "Hubo algo mal con su información de inicio de sesión."
          render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Te has desconectado"
        redirect_to root_path
    end

end