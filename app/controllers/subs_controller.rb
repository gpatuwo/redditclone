class SubsController < ApplicationController

  before_action :is_current_user_moderator?, only: [:edit, :update], message: "You are not authorized to edit this sub"

  def show
    @sub = Sub.find_by_id(params[:id])
    # find searches by primary key. find_by searches by whatever key you specify
    # find is prefered bc primary key is always index BUUUT it will throw an ActiveRecord error and EXIT OUT of the method if it's false
    # find_by is an O(n) search
    if @sub
      render :show
    else
      flash.now[:errors] = "Sub not found" #miiiiight not show up...
      redirect_to subs_url
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
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user
    if @sub.save
      redirect_to sub_url(@sub.id)
    else
      flash.now[:errors] = "Invalid input"
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def is_current_user_moderator?
    @sub = Sub.find(params[:id])
    current_user.id == @sub.moderator_id
  end

end
