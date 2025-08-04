class SessionsController < ApplicationController
    skip_before_action :authenticate_user!, only: [:create]
    
    def create
      @user = User.find_by(email: params[:email])
      
      if @user&.valid_password?(params[:password])
        token = JwtService.encode(user_id: @user.id)
        render json: { user: @user, token: token }, status: :ok
      else
        render json: { error: 'Invalid credentials' }, status: :unauthorized
      end
    end
  end
  