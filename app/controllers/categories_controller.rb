class CategoriesController < ApplicationController
    before_action :set_category, only: [:edit, :update, :show]
    before_action :require_admin, except: [:index, :show]

    def index
        @categories = Category.paginate(page: params[:page], per_page: 5)
    end
    
    def new
        @category = Category.new
    end
    
    def create
        @category = Category.new(category_params)
        if @category.save
            flash[:success] = "La categoría fue creada de manera exitosa."
            redirect_to categories_path
        else
            render 'new'
        end
    end
    
    def edit

    end
    
    def update
        if @category.update(category_params)
            flash[:success] = "La categoría fue actualizada de manera exitosa."
            redirect_to category_path(@category)
        else
            render 'edit'
        end
    end
    
    def show
        @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
    end

    private
        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.require(:category).permit(:name)
        end
        
        def require_admin
            if !logged_in? || (logged_in? and !current_user.admin?)
                flash[:danger] = "Solo los administradores pueden ejecutar esta acción."
                redirect_to categories_path
            end
        end
end