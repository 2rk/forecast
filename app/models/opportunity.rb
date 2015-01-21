class Opportunity < ActiveRecord::Base
  belongs_to_selection :source
  belongs_to_selection :stage
  belongs_to_selection :type
  belongs_to_selection :lost_reason_type

  validates_presence_of :name

  def weighted_value
    if weighting
      value * weighting/100
    else
      0
    end
  end
end
