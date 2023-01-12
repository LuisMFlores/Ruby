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

    def average_salary
        salaries_sum = 0
        @employees.each { |employee| salaries_sum += @salaries[employee.title] }
        salaries_sum / (@employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.has_key?(title)}
        startup.employees.each { |employee| self.employees << employee }
        startup.close
    end

end
