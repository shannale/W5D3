require 'active_support/inflector'

class ModelBase
    def self.all
        data = QuestionsDatabase.execute(<<-SQL)
        SELECT * FROM #{self.table}
        SQL
    end

    def self.table
        self.to_s.tableize
    end

    def self.find_by_id(id)
        data = QuestionsDatabase.execute(<<-SQL)
        SELECT * FROM #{self.table}
        WHERE self.id = id
        SQL
    end
end