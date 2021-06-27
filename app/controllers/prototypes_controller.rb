class PrototypesController < ApplicationController
  
  
  def index
     @prototypes = Prototype.all
  end

  def new
      @prototype = Prototype.new
  end

  def create
      @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new 
    end
 end
  def show
      @prototype = Prototype.find(params[:id])
      @comment = Comment.new
      @comments = @prototype.comments
   end
    def edit
      @prototype = Prototype.find(params[:id])
    end

    def update
      if @prototype = Prototype.find(params[:id]) 
        prototype.update(prototype_params)
         redirect_to prototype_path(@prototype)
         else
          render :edit
        end
      end
  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
    end
 private
 def prototype_params
   params.require(:prototype).permit(:title, :catch_copy, :concept,:image).merge(user_id: current_user.id)
 end
  def contributor_cofirmation
    redirect_to root_path unless current_user == @prototype.user
      
    end
end