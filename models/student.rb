require_relative("../db/sql_runner.rb")

class Student

  attr_reader :first_name, :last_name, :house, :age, :id


  def initialize( options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @house = options['house']
    @age = options['age']
  end

  def save()
    sql = "INSERT INTO students(
      first_name,
      last_name,
      house,
      age)
      values
      ($1, $2, $3, $4)
      RETURNING *"
      values = [@first_name, @last_name, @house, @age]
      student = SqlRunner.run(sql, values)
      @id = student.first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id=$1"
    values = [id]
    students = SqlRunner.run(sql, values)
    result = Student.new(students.first)
  end

  def self.find_all
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map {|student| Student.new(student)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end


end
