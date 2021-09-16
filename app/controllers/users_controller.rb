class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Excelente #{@user.username}, iniciaste sesión de manera exitosa."
            redirect_to articles_path
        else
            render 'new'
        end
    end

    def edit

    end

    def update
        if @user.update(user_params)
            flash[:success] = "#{@user.username}, tu cuenta fue actualizada de manera exitosa."
            redirect_to articles_path
        else
            render 'edit'
        end
    end

    def show
        
    end

    private
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:username, :email, :password)
        end
end