require 'rails_helper'

RSpec.describe 'Garden Show' do
  describe 'As a visitor' do
    describe 'when I visit a gardens show page' do
      it 'then i see a list of plants that are included in that gardens plots and i see that this list is unique and only includes plants that take less than 100 days to harvest' do
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

        visit "/gardens/#{turing_garden.id}"

        expect(page).to_not have_content(sunflower.name)
        expect(page).to_not have_content(tomato.name)
        
        within "#plant-#{lily.id}" do
          expect(page).to have_content(lily.name)
          expect(page).to have_content(lily.days_to_harvest)
        end

        within "#plant-#{carrot.id}" do
          expect(page).to have_content(carrot.name)
          expect(page).to have_content(carrot.days_to_harvest)
        end
      end
    end
  end
end