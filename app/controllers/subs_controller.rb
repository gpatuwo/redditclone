class SubsController < ApplicationController

  before_action

  def show
    @sub = Sub.find(params[:id])
    if @sub
      render :show
    else
      flash.now[:errors] = "Sub not found"
      redirect :index
    end
  end

  def new

  end

  def index
    @subs = Sub.all
    render :index
  end

  def create

  end

  def edit

  end

  def update

  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end


end
