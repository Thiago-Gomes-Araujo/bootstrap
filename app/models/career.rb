class Career < ApplicationRecord
    has_many :positions

    validates :name, presence: true
    validates :description, presence: true
end
