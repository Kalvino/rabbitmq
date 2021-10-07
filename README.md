# Install gems

run `bundle install`

# Worker (consumer)

Start multiple worker processes in multiple terminals:

run `ruby worker.rb`

# New tasks (publishers)

Start a different terminal and run the following tasks at once:

`ruby new_task.rb First message.`
`ruby new_task.rb Second message..`
`ruby new_task.rb Third message...`
`ruby new_task.rb Fourth message....`
`ruby new_task.rb Fifth message.....`