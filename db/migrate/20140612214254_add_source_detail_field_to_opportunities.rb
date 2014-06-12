class AddSourceDetailFieldToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :source_detail, :string
  end
end
