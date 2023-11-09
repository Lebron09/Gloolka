class Manager < ApplicationRecord
    has_many :developers
    def full_name
        "#{last_name}, #{first_name}"
    end

    def self.search(query)
        if query
          where('last_name LIKE ? OR first_name LIKE ?', "%#{query}%", "%#{query}%")
        else
          all
        end
    end
end
