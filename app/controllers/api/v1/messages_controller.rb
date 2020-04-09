class Api::V1::MessagesController < ApplicationController
  def index
    messages = Message.all.map do |message|
      {
        "id": message.id,
        "author": message.user.email,
        "content": message.content,
        "created_at": message.created_at
      }
    end 
    render json: messages
  end

  def create
  end
end
