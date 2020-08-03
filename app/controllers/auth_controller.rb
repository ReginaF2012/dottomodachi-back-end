class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
      user = User.find_by(username: user_login_params[:username])
      if user && user.authenticate(user_login_params[:password])
        token = encode_token({ user_id: user.id })
        render json: { userdata: UserSerializer.new(user), jwt: token }, status: :accepted
      else
        render json: { errors: 'Invalid username or password' }, status: :unauthorized
      end
    end

    # User will be redirected here if they go to the page when there is a JWT in local storage
    def auto_login

      token = encode_token({ user_id: current_user.id })
      render json: { userdata: UserSerializer.new(current_user), jwt: token }, status: :accepte
      render json: { errors: 'Oops! Something went wrong.'}, status: :unauthorized

    end
  
    private
  
    def user_login_params
      params.require(:user).permit(:username, :password)
    end
end