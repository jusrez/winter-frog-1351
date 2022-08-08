turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

@plot_1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
@plot_2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
@plot_3 = library_garden.plots.create!(number: 2, size: "Small", direction: "South")
@plot_4 = other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

sunflower = Plant.create!(name: "Sunflower", description: "A bright yellow flower", days_to_harvest: 15)
lily = Plant.create!(name: "Lily", description: "A beautfiul white flower", days_to_harvest: 30)
orchid = Plant.create!(name: "Orchid", description: "A beautiful purple flower", days_to_harvest: 50)
succulent = Plant.create!(name: "Succulent", description: "A hardy plant that doesn't need much sunlight", days_to_harvest: 10)