RSpec.describe MrWattsonRaspberry::Endpoints::About do
  include Rack::Test::Methods

  def app
    MrWattsonRaspberry::Endpoints::About
  end

  describe '/v1/about API Description', type: :request do
    before do
      get '/v1/about'
    end

    it_behaves_like 'an available route'

    it 'required fields should be present' do
      expect(json.keys).to include('version')
      expect(json.keys).to include('name')
      expect(json.keys).to include('description')
      expect(json.keys).to include('vendor')
      expect(json.keys).to include('licence')
    end
  end
end
