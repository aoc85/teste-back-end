class Contact < ApplicationRecord
  validates :email, uniqueness: true, presence: true, allow_blank: false
end
