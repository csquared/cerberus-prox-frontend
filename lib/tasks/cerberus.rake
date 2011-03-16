desc "Swipes card"
task :swipe, [:card_id, :door, :action] => [:environment] do |_, args|
  raise "incomplete params" unless args.card_id && args.door && args.action
  AccessLog.create!(:card_id => args.card_id, 
                    :logged => Time.now,
                    :door =>  args.door,
                    :action => args.action)
end

desc "run fake xm-rpc server"
task :xml_rpc do
  Dir.chdir "app/externals"
  exec "bundle exec rackup --port 8080"
end

