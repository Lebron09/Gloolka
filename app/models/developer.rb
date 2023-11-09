class Developer < ApplicationRecord
    belongs_to :manager
    validates_presence_of :manager_id
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
