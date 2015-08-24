class SupRequest < ActiveRecord::Base

  validates :name,  presence:   {message: "Your Name is Required"},
                    uniqueness: {scope: :name}
  validates :email, presence:   {message: "Your Email is Required"},
                    format:     {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                                 on: :create, message: "The Address you have
                                 is not valid!"}

   def self.search(query)
       search_term = "%#{query}%"
     where(["name ILIKE :search_term OR email ILIKE :search_term OR message ILIKE :search_term", { search_term: search_term}])
   end

end
