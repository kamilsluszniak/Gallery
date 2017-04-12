class DrawingsController < ApplicationController
    before_action :set_drawing, only: [:edit, :update, :destroy]
    before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]
    respond_to :html, :js
    
    def index
        if params[:user]
            @user = User.find(params[:user][:id])
            @drawings = @user.drawings.page(params[:page]).per(10)
        else
            @drawings = Drawing.page(params[:page]).per(10)
            @latest_id = @drawings.first.id
        end
    end
    
    def show
        @id = params[:id].to_i
        @drawing = Drawing.find(@id)
        @prev = Drawing.where('id = ?', (@id - 1).to_s).select([:id]).first
        @next = Drawing.where('id = ?', (@id + 1).to_s).select([:id]).first
        @nav = {:prev => @prev, :next => @next}
    end
    
    def new
        @drawing = Drawing.new
    end
    
    def create
        @user = current_user
        @drawing = @user.drawings.create(drawing_params)
        
        if @drawing.save
            flash[:success] = "New drawing added."
            redirect_to @drawing
        else
            render 'new'
        end
    end
    
    def edit
        
    end
    
    def destroy
        if @drawing.destroy
            flash[:success] = "Drawing deleted."
            redirect_to drawings_url
        else
            flash[:danger] = "Problem with deleting."
        end
    end
    
    def update
        if @drawing.update_attributes(drawing_params)
            flash[:success] = "Drawing updated."
            redirect_to @drawing
        else
            flash[:danger] = "Incorrect attributes."
            redirect_to edit_drawing_url
        end
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
