# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :opportunity do
    name "MyString"
    organisation "MyString"
    contact_name "MyString"
    type_id "MyString"
    identified_at "2014-06-07"
    source_id 1
    source_detail "MyText"
    value 1
    weighting 1
    comments "MyText"
  end
end
