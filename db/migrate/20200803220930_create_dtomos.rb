class CreateDtomos < ActiveRecord::Migration[6.0]
  def change
    create_table :dtomos do |t|
      t.string :name
      t.belongs_to :user
      t.integer :happiness_meter, default: 75
      t.integer :hunger_meter, default: 75
      t.integer :weight_meter, default: 50
      t.integer :total_points, default: 0
      t.integer :evolution_countdown, default: 60
      t.string :evo_type, default: "N"
      t.integer :stage, default: 1

      t.timestamps
    end
  end
end
