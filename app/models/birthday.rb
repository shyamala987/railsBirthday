class Birthday < ApplicationRecord
    validates :name, presence: true
    validates :dob, presence: true, length: { is: 10 }
end
