class Position < ApplicationRecord
    belongs_to :company

    enum carrer: [ :developer, :business_inteligence, :information_technology,
                        :design, :product, :technology, :others ]
    enum contract: [ :clt, :pj, :match ]
end
