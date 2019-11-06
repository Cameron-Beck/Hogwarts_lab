require_relative("../db/sql_runner.rb")

class House

  attr_reader :name, :id


  def initialize( options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses(
      name
      values
      ($1)
      RETURNING *"
      values = [@name]
      houses = SqlRunner.run(sql, values)
      @id = house.first['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id=$1"
    values = [id]
    students = SqlRunner.run(sql, values)
    result = House.new(houses.first)
  end

  def self.find_all
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run(sql)
    result = houses.map {|house| House.new(house)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end


end
