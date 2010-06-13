module Sooner
  class Subscriber < ActiveRecord::Base

    validates :email, :presence => true, :uniqueness => true, :email_format => true
    validates :name, :presence => true, :uniqueness => true
    
    # writes email addresses to CSV file
    def save_csv
      begin
        file = File.open("public/#{ Sooner.csv_file.nil? ? 'subscribers.csv' : Sooner.csv_file }", "a")
        file << "#{ name },#{ email }\n"
        file.close
        return true
      rescue Exception => e
        self.errors.add_to_base(e.message + " (CSV)")
      end
    end
    
  end
end
