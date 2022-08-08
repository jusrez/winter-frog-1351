require 'rails_helper'

RSpec.describe 'Plots Index' do

  describe 'As a visitor' do
    describe 'When I visit the plots index page' do
      it 'I see a list of all plot numbers and under each plot number i see names of all that plots plants' do
        turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
        library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
        other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

        plot_1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
        plot_2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
        plot_3 = library_garden.plots.create!(number: 2, size: "Small", direction: "South")
        plot_4 = other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

        sunflower = Plant.create!(name: "Sunflower", description: "A bright yellow flower", days_to_harvest: 15)
        lily = Plant.create!(name: "Lily", description: "A beautfiul white flower", days_to_harvest: 30)
        orchid = Plant.create!(name: "Orchid", description: "A beautiful purple flower", days_to_harvest: 50)
        succulent = Plant.create!(name: "Succulent", description: "A hardy plant that doesn't need much sunlight", days_to_harvest: 10)
        carrot = Plant.create!(name: "Carrot", description: "A bright orange vegetable", days_to_harvest: 31)
        tomato = Plant.create!(name: "Tomato", description: "A bright red vegetable", days_to_harvest: 45)
        basil = Plant.create!(name: "Basil", description: "A green, leafy herb", days_to_harvest: 60)

        plot_1_sunflower = PlotPlant.create!(plot_id: plot_1.id, plant_id: sunflower.id)
        plot_1_carrot = PlotPlant.create!(plot_id: plot_1.id, plant_id: carrot.id)
        plot_2_lily = PlotPlant.create!(plot_id: plot_2.id, plant_id: lily.id)
        plot_2_tomato = PlotPlant.create!(plot_id: plot_2.id, plant_id: tomato.id)
        plot_3_orchid = PlotPlant.create!(plot_id: plot_3.id, plant_id: orchid.id)
        plot_3_basil = PlotPlant.create!(plot_id: plot_3.id, plant_id: basil.id)
        plot_4_succulent = PlotPlant.create!(plot_id: plot_4.id, plant_id: succulent.id)
        
        visit '/plots'

        within "#plot-#{plot_1.id}" do
          expect(page).to have_content("Plot number: 25")
          expect(page).to have_content(sunflower.name)
          expect(page).to have_content(carrot.name)
          expect(page).to_not have_content(lily.name)
          expect(page).to_not have_content(tomato.name)
          expect(page).to_not have_content(orchid.name)
          expect(page).to_not have_content(basil.name)
          expect(page).to_not have_content(succulent.name)
        end

        within "#plot-#{plot_2.id}" do
          expect(page).to have_content("Plot number: 26")
          expect(page).to have_content(lily.name)
          expect(page).to have_content(tomato.name)
          expect(page).to_not have_content(sunflower.name)
          expect(page).to_not have_content(carrot.name)
          expect(page).to_not have_content(orchid.name)
          expect(page).to_not have_content(basil.name)
          expect(page).to_not have_content(succulent.name)
        end

        within "#plot-#{plot_3.id}" do
          expect(page).to have_content("Plot number: 2")
          expect(page).to have_content(orchid.name)
          expect(page).to have_content(basil.name)
          expect(page).to_not have_content(sunflower.name)
          expect(page).to_not have_content(carrot.name)
          expect(page).to_not have_content(lily.name)
          expect(page).to_not have_content(tomato.name)
          expect(page).to_not have_content(succulent.name)
        end

         within "#plot-#{plot_4.id}" do
          expect(page).to have_content("Plot number: 738")
          expect(page).to have_content(succulent.name)
          expect(page).to_not have_content(sunflower.name)
          expect(page).to_not have_content(carrot.name)
          expect(page).to_not have_content(lily.name)
          expect(page).to_not have_content(tomato.name)    
          expect(page).to_not have_content(orchid.name)
          expect(page).to_not have_content(basil.name)       
        end
      end

      it 'next to each plants name I see a link to remove that plant from that plot. When I click on that link, im returned to the plots index page and i no longer see that plant listed under that plot' do
        turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
        library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
        other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

        plot_1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
        plot_2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
        plot_3 = library_garden.plots.create!(number: 2, size: "Small", direction: "South")
        plot_4 = other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

        sunflower = Plant.create!(name: "Sunflower", description: "A bright yellow flower", days_to_harvest: 15)
        lily = Plant.create!(name: "Lily", description: "A beautfiul white flower", days_to_harvest: 30)
        orchid = Plant.create!(name: "Orchid", description: "A beautiful purple flower", days_to_harvest: 50)
        succulent = Plant.create!(name: "Succulent", description: "A hardy plant that doesn't need much sunlight", days_to_harvest: 10)
        carrot = Plant.create!(name: "Carrot", description: "A bright orange vegetable", days_to_harvest: 31)
        tomato = Plant.create!(name: "Tomato", description: "A bright red vegetable", days_to_harvest: 45)
        basil = Plant.create!(name: "Basil", description: "A green, leafy herb", days_to_harvest: 60)

        plot_1_sunflower = PlotPlant.create!(plot_id: plot_1.id, plant_id: sunflower.id)
        plot_1_carrot = PlotPlant.create!(plot_id: plot_1.id, plant_id: carrot.id)
        plot_2_lily = PlotPlant.create!(plot_id: plot_2.id, plant_id: lily.id)
        plot_2_tomato = PlotPlant.create!(plot_id: plot_2.id, plant_id: tomato.id)
        plot_3_orchid = PlotPlant.create!(plot_id: plot_3.id, plant_id: orchid.id)
        plot_3_basil = PlotPlant.create!(plot_id: plot_3.id, plant_id: basil.id)
        plot_4_succulent = PlotPlant.create!(plot_id: plot_4.id, plant_id: succulent.id)

        visit '/plots'

        within "#plant-#{sunflower.id}" do
          expect(page).to have_link("Remove this plant from this plot")
        end

        within "#plant-#{carrot.id}" do
          expect(page).to have_link("Remove this plant from this plot")          
        end

        within "#plant-#{lily.id}" do
          expect(page).to have_link("Remove this plant from this plot")
        end

        within "#plant-#{tomato.id}" do
          expect(page).to have_link("Remove this plant from this plot")
        end

        within "#plant-#{succulent.id}" do
          expect(page).to have_link("Remove this plant from this plot")
        end

        within "#plant-#{orchid.id}" do
          expect(page).to have_link("Remove this plant from this plot")
        end

        within "#plant-#{basil.id}" do
          expect(page).to have_link("Remove this plant from this plot")
        end

        within "#plant-#{sunflower.id}" do
          click_link "Remove this plant from this plot"
        end

        expect(current_path).to eq("/plots")
        
        within "#plot-#{plot_1.id}" do
          expect(page).to_not have_content(sunflower.name)
          expect(page).to have_content(carrot.name)
        end
      end
    end
  end
end