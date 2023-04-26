class Users < ModelBase

    def initialize(options)
        @fname= options[:fname] 
        @lname = options[:lname] 
    end 

    def self.find_by_name(fname, lname)
        name = QuestionsDatabase.execute(<<-SQL, fname: fname, lname: lname)
        SELECT * FROM #{self.table}
        WHERE fname = :fname AND lname = :lname 
        SQL

        selected = name.map{|value| self.new(value) unless name.nil?}

    end 

end