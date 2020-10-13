class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss
        boss.add_employee(self) if !boss.nil?
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def bonus(multiplier)
        total_subemployee_salary = @employees.map(&:salary).sum
        employees.each { |employee| total_subemployee_salary += employee.employees.map(&:salary).sum if employee.is_a?(Manager) }
        total_subemployee_salary * multiplier
    end

    def add_employee(employee)
        @employees << employee
    end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
