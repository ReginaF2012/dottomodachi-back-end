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

    private

    def dtomo_params
        params.require(:dottomodachi).permit(:id, :name, :user_id, :happiness_meter, :hunger_meter, :weight_meter, :total_points, :evolution_countdown, :stage, :evo_type)
    end

end