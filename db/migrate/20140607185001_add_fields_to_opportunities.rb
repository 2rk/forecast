class AddFieldsToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities ,:est_close_at, :date
  end
end
