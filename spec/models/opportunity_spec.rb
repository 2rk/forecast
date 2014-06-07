require 'spec_helper'

describe Opportunity do

  common_lets

  # define the opportunity, opportunity_other,... instances in
  # spec/support/common_lets.rb
  it { expect(opportunity).to be_valid }
#  it { expect(opportunity_other).to be_valid }

end
