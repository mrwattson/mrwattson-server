class Sender
  HTTP_CONFIG = {
    host: 'http://192.168.0.117',
    endpoint: '/api/v1/reading',
    device_id: 'MAT001'
  }.freeze

  def self.send_read(reading)
    response = HTTP.post(
      "#{HTTP_CONFIG[:host]}#{HTTP_CONFIG[:endpoint]}",
      params: {
        device_id: HTTP_CONFIG[:device_id].to_s,
        now: Time.now.to_i.to_s,
        id: reading.id.to_s,
        raw: reading.raw.to_s,
        created_at: reading.created_at.to_i.to_s
      }
    )

    puts "Request response: #{response.code}"

    response.code
  rescue StandardError => exception
    puts 'Failed request to remote API'
    puts exception
    500
  end
end
