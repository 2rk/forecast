class SetValueDefault < ActiveRecord::Migration
  def change
    change_column :opportunities, :value, :integer, default: 0
  end
end
