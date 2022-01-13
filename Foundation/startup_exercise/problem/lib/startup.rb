require "employee"
require "byebug"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        unless valid_title?(title)
            raise "Invalid Title"
        end

        @employees << Employee.new(employee_name, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        payment_amount = @salaries[employee.title]
      
        unless  @funding > payment_amount
            raise "Not enough funding"
        end

        employee.pay(payment_amount)
        @funding -= payment_amount
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end


    def average_salary
        combined_salaries = 0
        @employees.each { |employee| combined_salaries += @salaries[employee.title] }
        combined_salaries / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @employees += startup.employees
        startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @funding += startup.funding
        startup.close
    end

end
