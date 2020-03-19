class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.integer :nr
      t.integer :wday

      t.timestamps
    end
  end
end
