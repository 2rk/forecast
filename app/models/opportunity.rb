class Opportunity < ActiveRecord::Base
  belongs_to_selection :source
  belongs_to_selection :stage
  belongs_to_selection :type
  belongs_to_selection :lost_reason_type

  validates_presence_of :name
end
