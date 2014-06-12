def common_lets
  # users
  let(:user) { create(:user, :authorize) }
  let(:user_other) { create(:user) }
  let(:user_admin) { create(:user, :admin) }
  let(:user_super_admin) { create(:user, :super_admin) }
  let(:user_unconfirmed) { create :user, confirmed_at: nil, password: nil, password_confirmation: nil }

  # customer price list
  let(:customer_price_list) { create(:customer_price_list, customer: customer) }
  let(:customer_price_list_other) { create(:customer_price_list, customer: customer_other) }

  # cordell companies
  let(:cordell_company) { create(:cordell_company) }
  let(:cordell_company_other) { create(:cordell_company) }

  # customer action plans
  let(:customer_action_plan) { create(:customer_action_plan, customer: customer, user: user) }
  let(:customer_action_plan_other) { create(:customer_action_plan, customer: customer_other, user: user_other) }

  # customer
  let(:customer) { create(:customer, customer_rep_id: user.rep_id) }
  let(:customer_same_rep) { create(:customer, customer_rep_id: user.rep_id) }
  let(:customer_other) { create(:customer, customer_rep_id: user_other.rep_id) }

  # pat (Pricing Approval Templates)
  let(:pat) { create(:pat, :created_by_user => user, :customer => customer) }
  let(:pat_other) { create(:pat, :created_by_user => user_other, :customer => customer_other) }
end
