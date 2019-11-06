require_relative('../models/student.rb')
require("pry-byebug")

Student.delete_all()

student1= Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house" => "Gryffindor",
  "age" => 16
  })

student2= Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house" => "Gryffindor",
  "age" => 16
  })

  student1.save()
  student2.save()
  students = Student.find_all
