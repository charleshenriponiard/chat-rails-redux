class ChannelsController < ApplicationController
  def show
    if params[:id].blank?
      redirect_to channel_path(Channel.first.name)
      @user = current_user
    else
      @channel = Channel.find_by(name: params[:id])
      @channels = Channel.all
      @user = current_user
    end
  end


  def create
    message = Message.create!(user: current_user, content: message_params, channel: params[:name])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end 
end
