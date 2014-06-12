class Opportunity < ActiveRecord::Base
  belongs_to_selection :source
  belongs_to_selection :stage
  belongs_to_selection :type
end
