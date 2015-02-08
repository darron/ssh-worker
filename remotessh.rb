require 'net/ssh'
require 'yaml'

config = YAML.load_file('remotessh.yml')

Net::SSH.start(config['hostname'], config['creds']['username'], password: config['creds']['password']) do |ssh|
  ssh.exec config['command']
end
