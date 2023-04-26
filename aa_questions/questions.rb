class Questions < ModelBase
    def initialize(options)
        @title = options[:title] 
        @body = options[:body] 
        @author_id = options[:author_id]
    end 
    # Question.new({title:“arg1”,  body:“arg2”, author_id:3})

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.execute(<<-SQL, id: author_id)
        SELECT * FROM #{self.table}
        WHERE id = :author_id
        SQL

        selected = data.map {|value| self.new(value) unless data.nil?}
        selected

    end 

    


end