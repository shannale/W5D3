require 'active_support/inflector'

class ModelBase
    def self.all
        data = QuestionsDatabase.execute(<<-SQL)
        SELECT * FROM #{self.table}
        SQL
        data.map {|value| self.new(value)}
    end

    def self.table
        self.to_s.tableize
    end

    def self.find_by_id(id)
        data = QuestionsDatabase.execute(<<-SQL, id: id)
        SELECT * FROM #{self.table}
        WHERE id = :id
        SQL

        self.new(data) unless data.nil?

    end
end