require "./person.rb"

class Teacher < Person
    attr_accessor :specialization
    def initialize(id, age, name = "unknown", parent_permission = true, specialization)
        super(id, name, age, parent_permission)
        @specialization = specialization
    end
    def can_use_services?
        return true
    end
end