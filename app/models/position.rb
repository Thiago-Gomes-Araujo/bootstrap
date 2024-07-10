class Position < ApplicationRecord
    belongs_to :company
    belongs_to :career
    belongs_to :contract
    belongs_to :type_vacancy

    validates :career, presence: true
    validates :contract, presence: true
    validates :type_vacancy, presence: true

end
