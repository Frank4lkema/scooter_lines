class CreateScooterLines < ActiveRecord::Migration[7.1]
  def change
    create_table :scooter_lines do |t|
      t.text :quote

      t.timestamps
    end
  end
end
