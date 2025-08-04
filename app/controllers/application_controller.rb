class ApplicationController < ActionController::API
    before_action :authenticate_user!
    
    private
    
    def authenticate_user!
      token = request.headers['Authorization']&.split(' ')&.last
      return render json: { error: 'Unauthorized' }, status: :unauthorized unless token
      
      decoded = JwtService.decode(token)
      return render json: { error: 'Invalid token' }, status: :unauthorized unless decoded
      
      @current_user = User.find(decoded[:user_id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'User not found' }, status: :unauthorized
    end
    
    def current_user
      @current_user
    end
  end
  
