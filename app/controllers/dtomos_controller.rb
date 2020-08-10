class DtomosController < ApplicationController

    def index
        dtomos = current_user.dtomos.valid_dtomos
        render json: DtomoSerializer.new(dtomos).to_serialized_json
    end

    def update
        dtomo = Dtomo.find_by(id: params[:dottomodachi][:id])
        dtomo.update(dtomo_params)
        render json: DtomoSerializer.new(dtomo).to_serialized_json
    end

    def create
        dtomo = Dtomo.new(dtomo_params)
        dtomo.user = current_user
        if dtomo.save
            render json: DtomoSerializer.new(dtomo).to_serialized_json
        else
            render json: { errors: "failed to adopt #{dtomo_params[:name]}" }, status: :not_acceptable
        end
    end

    def destroy
        dtomo = Dtomo.find_by(id: params[:id])
        dtomo.destroy
    end

    private

    def dtomo_params
        params.require(:dottomodachi).permit(:id, :name, :user_id, :happiness_meter, :hunger_meter, :weight_meter, :total_points, :evolution_countdown, :stage, :evo_type)
    end

end