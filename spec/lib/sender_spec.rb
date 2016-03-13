RSpec.describe Sender do
  it 'should not raise exception when reading is sent' do
    reading = MrWattsonRaspberry::Models::Reading.new raw: 3.53

    response = Sender.send_read(reading)

    expect(response).not_to eq 500
  end
end
