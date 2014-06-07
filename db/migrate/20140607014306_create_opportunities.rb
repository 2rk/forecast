class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :name
      t.string :organisation
      t.string :type_id
      t.date :date_received
      t.integer :source_id
      t.integer :value
      t.integer :weighting
      t.text :comments

      t.timestamps
    end
  end
end
