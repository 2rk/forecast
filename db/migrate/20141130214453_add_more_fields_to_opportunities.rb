class AddMoreFieldsToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :est_effort_days, :integer
    add_column :opportunities, :lost_reason_type_id, :integer
    add_column :opportunities, :lost_reason, :string
  end
end
