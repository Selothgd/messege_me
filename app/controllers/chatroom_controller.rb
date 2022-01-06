class ChatroomController < ApplicationController

  def new
    @chatroom = chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      flash[:notice] = "chatroom was successfully created"
      redirect_to @chatroom
    else
      render 'new'
    end
  end

  def edit
    @chatroom = Chatroom.find(params[:id])
  end

  def update
    @chatroom = Chatroom.find(params[:id])
    if @chatroom.update(chatroom_params)
      flash[:notice] = "chatroom name updated successfully"
      redirect_to @chatroom
    else
      render 'edit'
    end
  end

  def index
   # @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
  end
  
  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
end