require 'rake'
require 'rspec/core/rake_task'


hosts = [
	{
		:name  => 'melody',
		:roles => %w( 000_base,010_http,100_melody ),
	},
	{
		:name  => 'second',
		:roles => %w( 000_base,010_http,101_second ),
	},
	{
		:name  => 'third',
		:roles => %w( 000_base,010_http,102_third ),
	},
]


hosts = hosts.map do |host|
	{    
		:name  => host[:name],
		:roles => host[:roles],
	}

end


desc "Run serverspec to all hosts"
task :serverspec => 'serverspec:all' 


namespace :serverspec do
	task :all => hosts.map { |h|'serverspec:' + h[:name]}
	hosts.each do |host|
		desc "Run serverspec to #{host[:name]}"
		RSpec::Core::RakeTask.new(host[:name].to_sym) do |t| 
			ENV['TARGET_HOST'] = host[:name]
			puts;puts "### #{ENV['TARGET_HOST']} TEST START ###" ;puts
			t.pattern = 'spec/{' + host[:roles].join('	,') + '}/*_spec.rb'
			t.fail_on_error = false
		end
	end
end

