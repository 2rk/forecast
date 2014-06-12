# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# so we can use selections in our factory seeds
puts 'Loading fixtures'
Rake::Task['db:fixtures:load'].invoke

puts 'Deleting existing data...'
Opportunity.delete_all

puts 'Creating Opportunities'
10.times do
  FactoryGirl.create(:opportunity, name: Faker::Company.bs, organisation: Faker::Company.name, type_id: Selection.opportunity_type_rails.id,
                   identified_at: Time.now - rand(180).days , est_close_at: Time.now - 10 + rand(60).days, value: rand(13) * 6000,
                   stage_id: Selection.opportunity_stage_idea.id, weighting: 10,comments: Faker::Lorem::paragraph(3),
                  source_id: Selection.opportunity_source_partner.id)
end
