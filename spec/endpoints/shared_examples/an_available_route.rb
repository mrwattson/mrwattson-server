RSpec.shared_examples_for 'an available route' do
  it { expect(last_response).to be_ok }
end
