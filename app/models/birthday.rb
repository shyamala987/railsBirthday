class Birthday < ApplicationRecord
    validates :name, presence: true
    validates :birthday, presence: true, length: { is: 10 }
end
