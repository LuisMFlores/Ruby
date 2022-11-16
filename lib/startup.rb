require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding >startup.funding
    end

    def hire(name, title)
        raise "title is invalid" if !self.valid_title?(title)
        @employees << Employee.new(name, title)
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
            return
        end

        raise "Not enough funding"
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end
end
