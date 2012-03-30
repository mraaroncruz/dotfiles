require 'mechanize'
threads = []
t = Time.now
count = 0
puts t
(1..(ARGV[0].to_i || 200)).each do |n|
  threads << Thread.new do
    begin
      c = count
      count += 1
      puts "#{c} before"
      a = Mechanize.new { |agent|
        agent.user_agent_alias = "iPhone"
      }
      a.get('http://example.com') do |page|
        dashboard = page.form_with(:id => 'user_new') do |form|
          puts "#{c} login page"
          login = form.field_with(name: "user[login]") 
          login.value = "user#{n}@example.com"
          password = form.field_with(name: "user[password]") 
          password.value = "password"
        end.submit
        puts "#{c} dashboard page"
        ass = a.click(dashboard.link_with(text: /Assessments/))
        puts "#{c} assessments page"
      end
    rescue Exception => e
      puts e.message
    end
  end
end

threads.each do |thread|
  thread.join
end

puts Time.now
puts "Time::"
puts t - Time.now
