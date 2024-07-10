class Company < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_many :positions, dependent: :destroy
    has_one_attached :logo, dependent: :destroy

    validates :name, presence: true
    validates :url, presence: true
end
