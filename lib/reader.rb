class Reader
  DEVICE_CONFIG = {
    port_str: '/dev/cu.usbmodem1411',
    baud_rate: 9600,
    data_bits: 8,
    stop_bits: 1,
    parity: SerialPort::NONE
  }.freeze

  def self.current_port
    SerialPort.new(
      DEVICE_CONFIG[:port_str],
      DEVICE_CONFIG[:baud_rate],
      DEVICE_CONFIG[:data_bits],
      DEVICE_CONFIG[:stop_bits],
      DEVICE_CONFIG[:parity]
    )
  end

  def self.listen
    serial_port = current_port

    loop do
      while (read = serial_port.gets.chomp)
        reading = MrWattsonRaspberry::Models::Reading.create(raw: read.to_f)
        Sender.send_read(reading)
        puts reading.to_s
      end
    end
  rescue StandardError => exception
    puts exception
  ensure
    serial_port.close
  end
end
