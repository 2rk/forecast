require 'spec_helper'

describe OpportunitiesController do
  describe 'routing' do

    it('routes to #index') { get('/opportunities').should route_to('opportunities#index') }
    it('routes to #new') { get('/opportunities/new').should route_to('opportunities#new') }
    it('routes to #show') { get('/opportunities/1').should route_to('opportunities#show', id: '1') }
    it('routes to #edit') { get('/opportunities/1/edit').should route_to('opportunities#edit', id: '1') }
    it('routes to #create') { post('/opportunities').should route_to('opportunities#create') }
    it('routes to #update') { put('/opportunities/1').should route_to('opportunities#update', id: '1') }
    it('routes to #destroy') { delete('/opportunities/1').should route_to('opportunities#destroy', id: '1') }
  end
end
