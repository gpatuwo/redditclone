class SubsController < ApplicationController

  before_action :is_current_user_moderator?, only: [:edit, :update]

  def show
    @sub = Sub.find(params[:id])
    # find searches by primary key. find_by searches by whatever key you specify
    # find is prefered bc primary key is always index
    # find_by is an O(n) search
    if @sub
      render :show
    else
      flash.now[:errors] = "Sub not found"
      redirect :index
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end


  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save
      redirect_to sub_url(@sub.id)
    else
      fail
      flash.now[:errors] = "You must be signed in to create a sub"
      render :new
    end
  end

  def edit

  end

  def update

  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def is_current_user_moderator?
    current_user.id == @sub.moderator.id
  end

end
