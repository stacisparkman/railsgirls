class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
    render 'index'
  end

  def show
    @idea = Idea.find(params[:id])
    render 'show'
  end

  def new
    @idea = Idea.new
    render 'new'
  end

  def edit
    @idea = Idea.find(params[:id])
    render 'edit'
  end

  def create
    @idea = Idea.new(idea_params)

    if @idea.save
      redirect_to @idea, notice: 'Idea was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to @idea, notice: 'Idea was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    redirect_to ideas_url, notice: 'Idea was successfully destroyed.'
  end

  private
  # Only allow a trusted parameter "white list" through.
  def idea_params
    params.require(:idea).permit(:name, :description, :picture)
  end

end
