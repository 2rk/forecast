# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# so we can use selections in our factory seeds
Rake::Task['db:fixtures:load'].invoke

puts 'Deleting existing data...'
Opportunity.delete_all

puts 'Creating Opportunities'
20.times do
  FactoryGirl.create(:opportunity, name: Faker::Company.bs, organisation: Faker::Company.name, type_id: Selection.opportunity_type_rails.id,
                   identified_at: "2014-01-15", comments: Faker::Lorem::paragraph(3) )
end
