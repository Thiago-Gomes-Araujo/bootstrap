class Career < ApplicationRecord
  has_many :positions

  def self.ransackable_attributes(auth_object = nil)
    %w[name description]  # Adicione outros atributos conforme necessário
  end

  validates :name, presence: true
  validates :description, presence: true
end
