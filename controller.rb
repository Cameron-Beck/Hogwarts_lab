require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/student.rb')
also_reload ('/models/*')

get '/students' do
  @students = Student.find_all
  erb(:index)
end

get '/students/new' do
  erb(:new)
end
