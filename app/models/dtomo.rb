class Dtomo < ApplicationRecord
    belongs_to :user
    validate :name_validator
    validates :name, presence: :true
    validates :stage, inclusion: { in: [1, 2, 3, 4] }
    validates :evo_type, inclusion: { in: %w(good bad neutral) }
    validates :happiness_meter, inclusion: { in: (0..100).to_a }
    validates :hunger_meter, inclusion: { in: (0..100).to_a }
    validates :weight_meter, inclusion: { in: (0..100).to_a }
    validates :total_points, numericality: :true
    validates :evolution_countdown, numericality: :true

    scope :valid_dtomos, -> {where("stage < ?", 4)}

    def name_validator
        return if name =~ /\A(?=.*?[A-Za-z0-9]).{1,15}\z/
        errors.add :name, "requirements not met. Length should be 1-15 characters and can only inclusion: alphanumeric characters and underscores"
    end
    
end
