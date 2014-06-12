class AddStageDatesToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :idea_at, :date
    add_column :opportunities, :lead_at, :date
    add_column :opportunities, :initial_contact_at, :date
    add_column :opportunities, :needs_analysis_at, :date
    add_column :opportunities, :solution_development_at, :date
    add_column :opportunities, :negotiation_at, :date
    add_column :opportunities, :won_lost_at, :date
  end
end
