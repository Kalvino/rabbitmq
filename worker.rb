require 'bunny'
connection = Bunny.new

connection.start

channel = connection.create_channel

queue = channel.queue('task_queue', durable: true)

channel.prefetch(1)

puts '[*] waiting for messages. To exit, press CTRL+C'

begin
  queue.subscribe(manual_ack:true, block: true) do |_delivery_info, _properties, body|
    puts " [x] Received #{body}"

    #imitate some work
    sleep body.count('.').to_i
    channel.ack(_delivery_info.delivery_tag)
  end
rescue Interrupt => _
  connection.close
  exit(0)
end
