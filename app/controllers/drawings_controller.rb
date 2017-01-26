class DrawingsController < ApplicationController
    before_action :set_drawing, only: [:show, :edit, :update, :destroy]
    before_action :logged_in_user, only: [:new, :create, :destroy, :edit, :update]
    
    def index
        @drawings = Drawing.order(:created_at).page(params[:page]).per(10)
    end
    
    def show
    end
    
    def new
        @drawing = Drawing.new
    end
    
    def create
        @user = current_user
        @drawing = @user.drawings.create(drawing_params)
        
        if @drawing.save
            flash[:success] = "Rysunek dodany"
            redirect_to root_url
        else
            render 'new'
        end
    end
    
    def destroy
    end
    
    def update
    end
    
    private
        def set_drawing
            @drawing = Drawing.find(params[:id])
        end

    # Never trust parameters from the scary internet, only allow the white list through.
        def drawing_params
            params.require(:drawing).permit(:title, :attachment)
        end
end
