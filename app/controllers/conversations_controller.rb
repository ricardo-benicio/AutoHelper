class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations.includes(:messages)
    render json: @conversations.as_json(include: :messages)
  end

  def show
    @conversation = current_user.conversations.find(params[:id])
    render json: @conversation.as_json(include: :messages)
  end

  def create
    @conversation = current_user.conversations.create!(status: 'active')
    render json: @conversation, status: :created
  end
end

