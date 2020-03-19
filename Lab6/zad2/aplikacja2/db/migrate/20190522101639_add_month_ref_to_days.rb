class AddMonthRefToDays < ActiveRecord::Migration[5.2]
  def change
    add_reference :days, :month, foreign_key: true
  end
end
