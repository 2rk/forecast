class AddContactToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :contact_name, :string
  end
end
