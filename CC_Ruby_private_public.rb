# Deberás crear una clase Employee con las siguientes variables de instancia:
# name, email, salary & deposit_account.

class Employee
	#Reader & writer variables.
	attr_accessor :name, :email, :salary, :deposit_account

	#Initialize variables
	def initialize(name, email, salary, deposit_account)
		@name = name
		@email = email
		@salary = salary
		@deposit_account = deposit_account
	end

	#Method to return text string
	def to_s
		"#{@name} <email: #{@email}> acct: #{hidden_digits(@deposit_account)}"
	end

	#Replace first five digits by '*' 
	def hidden_digits(num)
		array = @deposit_account.match(/(\d{3})-(\d{3})-(\d{3})/).captures
		array2 = array.join()
		array2.gsub(/.(?=.{4})/,'*')
	end

	#Compute vacations
  def vacation_days
    coefficient * 7  
  end

  #Compute bonus
  def bonus
    coefficient * 1000
  end

  #Private methods
  private

  def coefficient
    coefficients = { 1 => 0...1_000, 1.2 => 1_000...2_000, 1.4 => 2_000...5_000, 1.5 => 5_000..10_000 }

    coefficients.find { |coefficient, range| range.include? @salary }.first
  end

end

#Driver code
employee = Employee.new('Juan Perez', 'juan@gmail.com', 1_800, '123-456-512')

p employee.to_s
# => "Juan Perez <email: juan@gmail.com> acct: *****6512"

str = "The employee information is #{employee}"
puts str
# => "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts str == "The employee information is Juan Perez <email: juan@gmail.com> acct: *****6512"

puts employee.vacation_days == 8.4
puts employee.bonus == 1_200





