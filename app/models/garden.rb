class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  def garden_plants
    plants.where('days_to_harvest < ?', 100).uniq
  end
end
