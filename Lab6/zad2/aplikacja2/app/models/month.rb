class Month < ApplicationRecord
    belongs_to :year
    has_many :days
    validates :nr, uniqueness: false, numericality: true, presence: true, inclusion: 1..12
    validates :name, uniquness: false, numericality: false, presence: true, length: { minimum: 3}
end
