desc "meme"

namespace :db do
  task :import => :environment do
    require 'CSV'

    # sean = User.find_by(email: 'sean.kelly@tworedkites.com')

    CSV.foreach("oppty2.csv", headers: true) do |line|
      new_oppty = Opportunity.new
      print ' - processing'
      new_oppty.organisation = line[0]
      new_oppty.name = line[1]
      new_oppty.contact_name = line[2]
      new_oppty.stage_id = Selection.opportunity_stage_idea.id
      new_oppty.value = line[4]
      unless line[5].is_nil?
        new_oppty.est_close_at = Date.parse(line[5])
      end
      new_oppty.weighting = line[6]
      new_oppty.comments = line[9]
      new_oppty.save!
      puts
    end
  end

end
