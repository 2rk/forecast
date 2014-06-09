class Opportunity < ActiveRecord::Base
  belongs_to_selection :type
  belongs_to_selection :stage
end
