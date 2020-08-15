class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
      user = User.create(user_params)
      if user.valid?
        token = encode_token(user_id: user.id)
        render json: { userdata: UserSerializer.new(user), jwt: token }, status: :created
      else
        if user.errors.full_messages.is_a?(String)
          render json: { errors: "#{user.errors.full_messages}" }, status: :not_acceptable
        else
          render json: { errors: "#{user.errors.full_messages.join(", ")}" }, status: :not_acceptable
        end
      end
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end