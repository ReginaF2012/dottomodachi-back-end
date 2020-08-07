class DtomoSerializer
    def initialize(dtomo_object)
        @dtomo = dtomo_object
    end

    def to_serialized_json
        options = {only: [:id, :name, :happiness_meter, :hunger_meter, :weight_meter, :evo_type, :stage, :total_points, :evolution_countdown]}

        @dtomo.to_json(options)
    end
end