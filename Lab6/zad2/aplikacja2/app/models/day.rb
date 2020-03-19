class Day < ApplicationRecord
    belongs_to :month
    validates :nr, uniqueness: false, numericality: true, presence: true, inclusion: 1..31
    validates :wday, uniquess: false, numericality: true, presence: true, inclusion: 0..6
end
