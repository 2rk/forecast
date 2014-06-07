require 'spec_helper'

describe OpportunitiesController do
  render_views
  common_lets

  before :all do
    Fracture.define_selector :new_opportunity_link
    Fracture.define_selector :cancel_new_opportunity_link
    Fracture.define_selector :edit_opportunity_link
    Fracture.define_selector :cancel_edit_opportunity_link
  end

  # stub strong params
  before { controller.stub(opportunity_params: {}) }

  context 'not logged in' do
    before do
      sign_out :user
    end

    {index: :get, show: :get, new: :get, create: :post, edit: :get, update: :put, destroy: :delete}.each do |v, m|
      it "#{m} #{v} should logout" do
        self.send(m, v, id: opportunity)
    should redirect_to new_user_session_path
  }
    end
  end

  context 'logged in as user' do
    before { sign_in user }

    describe 'GET index' do
      before do
        opportunity; opportunity_other
        get :index
      end

      it { should assign_to(:opportunities).with_items([opportunity]) }
      it { should render_template :index }
      it { should have_only_fractures(:new_opportunity_link) }
      end

          describe 'GET show' do
      before { get :show, id: opportunity }

    it { should assign_to(:opportunity).with(opportunity) }
    it { should render_template :show }
    it { should have_only_fractures(:edit_opportunity_link) }
    end

    describe 'GET new' do
      before { get :new }

      it { should assign_to(:opportunity).with_kind_of(Opportunity) }
      #it { should assign_to('opportunity.parent').with(parent) }
      it { should render_template :new }
      it { should have_only_fractures :cancel_new_opportunity_link }
      it { should have_a_form.that_is_new.with_path_of(opportunities_path)}
    end

    describe 'POST create' do
      context 'valid' do
        before do
          Opportunity.any_instance.stub(:valid?).and_return(true)
          post :create
        end

        it { should redirect_to opportunity_path(Opportunity.last) }
        it { should assign_to(:opportunity).with(Opportunity.last) }
        #it { should assign_to('opportunity.parent').with(parent) }
      end

      context 'invalid' do
        before do
          Opportunity.any_instance.stub(:valid?).and_return(false)
          post :create
        end
        it { should assign_to(:opportunity).with_kind_of(Opportunity) }
        #it { should assign_to('opportunity.parent').with(parent) }
        it { should render_template :new }
        it { should have_only_fractures :cancel_new_opportunity_link }
        it { should have_a_form.that_is_new.with_path_of(opportunities_path)}
      end
    end

    describe 'GET edit' do
      before { get :edit, id: opportunity }

      it { should assign_to(:opportunity).with(opportunity) }
      it { should render_template :edit }
      it { should have_only_fractures :cancel_edit_opportunity_link }
      it { should have_a_form.that_is_edit.with_path_of(opportunity_path) }
    end

    describe 'PUT update' do
      context 'valid' do
        before do
          Opportunity.any_instance.stub(:valid?).and_return(true)
          put :update, id: opportunity
        end

        it { should assign_to(:opportunity).with(opportunity) }
        it { should redirect_to opportunity_path(opportunity) }
      end
      context 'invalid' do
        before do
          opportunity
          Opportunity.any_instance.stub(:valid?).and_return(false)
          put :update, id: opportunity
        end

        it { should assign_to(:opportunity).with(opportunity) }
        it { should render_template :edit }
        it { should have_only_fractures :cancel_edit_opportunity_link }
        it { should have_a_form.that_is_edit.with_path_of(opportunity_path) }
      end
    end

    describe 'DELETE destroy' do
      before { delete :destroy, id: opportunity }

      it { expect(Opportunity.find_by_id(opportunity.id)).to be_nil }
      it { should redirect_to opportunities_path }
    end
  end
end
