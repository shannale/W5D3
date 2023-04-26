require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  DB_FILE = File.join(File.dirname(__FILE__), 'questions.db')

    def initialize
        # super('questions.db')
        @database = SQLite3::Database.new(DB_FILE)
        @database.type_translation = true 
        @database.results_as_hash = true 
    end

  
end