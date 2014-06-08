class Opportunity < ActiveRecord::Base
  belongs_to_selection :type
end
