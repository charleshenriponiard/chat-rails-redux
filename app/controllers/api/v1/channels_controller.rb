class Api::V1::ChannelsController < ApplicationController
  def index
    messages = Message.all
    render json: messages
  end

  def show
    messages = Message.where(channel: params[:id])
    render json: messages
  end 
end
