class Year < ApplicationRecord
    has_many :months
    validates :year, uniqueness: false, numericality: true, presence: true, inclusion: 1900..2100
end
