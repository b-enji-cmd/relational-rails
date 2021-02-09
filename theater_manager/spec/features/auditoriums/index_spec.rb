require 'rails_helper'

RSpec.describe 'When I visit auditoriums index page', type: :feature do
  describe 'it displays all auditorium names' do
    it 'with created date ordered by most recently created' do
      auditorium_1 = Auditorium.create( name: "North",
                                        capacity: 50,
                                        is_imax_auditorium: true)

      auditorium_2 = Auditorium.create( name: "North",
                                        capacity: 100,
                                        is_imax_auditorium: true)

      visit '/auditoriums'

      created_at_1 = auditorium_1.created_at.strftime("%m/%d/%Y %I:%M %p")
      created_at_2 = auditorium_2.created_at.strftime("%m/%d/%Y %I:%M %p")

      expect(page).to have_content(auditorium_1.name)
      expect(page).to have_content(auditorium_2.name)
      expect(page).to have_content(created_at_1)
      expect(page).to have_content(created_at_2)

      click_link('North', match: :first)
      expect(page).to have_content('Capacity: 100')
    end

    it 'it has link and redirects to auditoriums/new' do
      visit 'auditoriums'

      expect(page).to have_link(href: '/auditoriums/new')

      click_link 'New Auditorium'

      expect(page).to have_current_path('/auditoriums/new')
    end

    it 'has link to auditoriums/:id and displays all Auditorium data' do
      auditorium_1 = Auditorium.create( name: "North 1",
                                        capacity: 50,
                                        is_imax_auditorium: true)
      visit 'auditoriums'

      expect(page).to have_link(href: "/auditoriums/#{auditorium_1.id}")

      click_link 'North 1'

      expect(page).to have_link(href: '/auditoriums')
      expect(page).to have_content("Auditorium Index")
      expect(page).to have_content("North 1")
      expect(page).to have_content("Capacity: 50")
      expect(page).to have_content("IMAX Auditorium: Yes")
      expect(page).to have_content("Edit Auditorium")
      expect(page).to have_content("Delete Auditorium")
      expect(page).to have_link(href: "/auditoriums/#{auditorium_1.id}")
    end
  end
end
