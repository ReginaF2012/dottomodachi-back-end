class UsersController < ApplicationController

    def show
        user = User.find_by(id: params[:id])
        render json: UsersSerializer.new(user).to_serialized_json
    end

    def create
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end