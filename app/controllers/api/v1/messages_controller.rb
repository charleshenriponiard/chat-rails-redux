class Api::V1::MessagesController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_channel, only: [:index, :create]
  before_action :set_user, only: :create

  def index
    @messages = Message.where(channel: @channel).map do |message|
      {
        "id": message.id,
        "author": message.user.name,
        "content": message.content,
        "created_at": message.created_at
      }
    end
    render json: @messages
  end

  def create
    message = Message.new(user_id: @user.id, content: message_params[:content], channel_id: @channel.id)
    if message.save
      new_message = {
        "id": message.id,
        "author": message.user.name,
        "content": message.content,
        "created_at": message.created_at
      }
      render json: new_message
    end 
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end 

  def set_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end
  
  def set_user
    @user = User.find(params[:author].to_i)
  end 

end
