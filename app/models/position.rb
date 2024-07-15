class Position < ApplicationRecord
  belongs_to :company
  belongs_to :career
  belongs_to :contract
  belongs_to :type_vacancy
  belongs_to :state
  has_rich_text :description

  validates :career, presence: true
  validates :contract, presence: true
  validates :type_vacancy, presence: true
  validates :summary, length: { maximum: 250 }

end
