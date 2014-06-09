class AddStatusFieldToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :stage_id, :integer
  end
end
