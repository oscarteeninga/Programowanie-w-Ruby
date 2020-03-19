class Category < ApplicationRecord
    has_many :welcomes # Kategoria zawiera wiele komunikatów powitalnych
  end