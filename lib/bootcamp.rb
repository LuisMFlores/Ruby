class Bootcamp

    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h, v| h[v] = [] }
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(name)
        @teachers << name
    end

    def enroll(name)
        if @students.count < @student_capacity
            @students << name
            return true
        end

        false
    end

    def enrolled?(student)
        @students.include?(student)
    end
  
end
