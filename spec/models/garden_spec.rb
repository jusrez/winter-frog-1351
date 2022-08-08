require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it {should have_many(:plants) }
  end

  describe 'instance methods' do
    it 'will return a list of plant that are included in a gardens plots' do
      turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
      
      plot_1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
      plot_2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")

      sunflower = Plant.create!(name: "Sunflower", description: "A bright yellow flower", days_to_harvest: 125)
      lily = Plant.create!(name: "Lily", description: "A beautfiul white flower", days_to_harvest: 90)
      carrot = Plant.create!(name: "Carrot", description: "A bright orange vegetable", days_to_harvest: 31)
      tomato = Plant.create!(name: "Tomato", description: "A bright red vegetable", days_to_harvest: 150)

      plot_1_sunflower = PlotPlant.create!(plot_id: plot_1.id, plant_id: sunflower.id)
      plot_1_carrot = PlotPlant.create!(plot_id: plot_1.id, plant_id: carrot.id)
      plot_2_lily = PlotPlant.create!(plot_id: plot_2.id, plant_id: lily.id)
      plot_2_tomato = PlotPlant.create!(plot_id: plot_2.id, plant_id: tomato.id)
      plot_2_carrot = PlotPlant.create!(plot_id: plot_2.id, plant_id: carrot.id)

      expect(turing_garden.garden_plants.to_a).to eq([carrot, lily])
    end
  end
end
