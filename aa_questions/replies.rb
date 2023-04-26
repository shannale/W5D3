class Replies < ModelBase

    def initialize(options)
        @question_id = options[:question_id]
        @previous_reply_id = options[:previous_reply_id]
        @associated_author_id = options[:associated_author_id]
        @body = options[:body]
    end

    def self.find_by_user_id(user_id)
        reply = QuestionsDatabase.execute(<<-SQL, user_id: user_id)
        SELECT * FROM #{self.table}
        WHERE user_id = :user_id
        SQL

        responses = reply.map{|value| self.new(value) unless reply.nil?}
    end 
end