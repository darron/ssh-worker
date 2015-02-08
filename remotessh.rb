require 'net/ssh'
require 'yaml'

config = YAML.load_file('remotessh.yml')

Net::SSH.start(config['hostname'], config['creds']['username'], password: config['creds']['password']) do |ssh|
  ssh.exec config['command']
end

if config['slack']['enable'] == true
  slack_command = "#{config['slack']['command']} --data-urlencode 'payload={\"channel\": \"##{config['slack']['channel']}\", \"username\": \"#{config['slack']['username']}\", \"text\": \"#{config['slack']['text']}\", \"icon_emoji\": \":#{config['slack']['icon']}:\"}' #{config['slack']['url']}"
  system(slack_command)
end
