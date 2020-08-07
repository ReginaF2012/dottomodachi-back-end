class DtomosController < ApplicationController

    def index
        dtomos = current_user.dtomos
        render json: DtomoSerializer.new(dtomos).to_serialized_json
    end

end