require 'bunny'
# connection = Bunny.new(hostname: 'rabbit.local')
connection = Bunny.new(automatically_recover: false)

connection.start

channel = connection.create_channel

queue = channel.queue('task_queue', durable: true)

message = ARGV.empty? ? 'Hello World!' : ARGV.join(' ')

queue.publish(message, persistent: true)

# channel.default_exchange.publish('Hello World!', routing_key: queue.name)
puts "[x] sent #{message}"

connection.close