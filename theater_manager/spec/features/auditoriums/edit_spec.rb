require 'rails_helper'

RSpec.describe 'When I visit auditorium index', type: :feature do

  it 'I can update an auditorium' do
    Auditorium.destroy_all

    auditorium_1 = Auditorium.create( name: "North 1",
                                      capacity: 50,
                                      is_imax_auditorium: true)
    visit "/auditoriums"

    click_link("North 1")
    click_link("Edit Auditorium")

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}/edit")
    expect(page).to have_content("Editing North 1 Auditorium")
    fill_in('auditorium[name]', with: 'North 2')
    fill_in('auditorium[capacity]', with: '25')
    choose('auditorium_is_imax_auditorium_false')
    click_button('Update Auditorium')

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")
    expect(page).to have_content("North 2")
    expect(page).to have_content("Capacity: 25")
    expect(page).to have_content("IMAX Auditorium: No")

    auditorium_2 = Auditorium.create( name: "North 3",
                                      capacity: 100,
                                      is_imax_auditorium: false)
    visit "/auditoriums"

    click_link("North 3")
    click_link("Edit Auditorium")

    expect(current_path).to eq("/auditoriums/#{auditorium_2.id}/edit")
    expect(page).to have_content("Editing North 3 Auditorium")
    fill_in('auditorium[name]', with: 'North 4')
    fill_in('auditorium[capacity]', with: '101')
    choose('auditorium_is_imax_auditorium_true')
    click_button('Update Auditorium')

    expect(current_path).to eq("/auditoriums/#{auditorium_2.id}")
    expect(page).to have_content("North 4")
    expect(page).to have_content("Capacity: 101")
    expect(page).to have_content("IMAX Auditorium: Yes")
  end

  it 'I can update an auditorium but name is not changed if empty' do
    Auditorium.destroy_all

    auditorium_1 = Auditorium.create( name: "North 1",
                                      capacity: 50,
                                      is_imax_auditorium: true)
    visit "/auditoriums"

    click_link("North 1")
    click_link("Edit Auditorium")
    fill_in('auditorium[name]', with: '')
    fill_in('auditorium[capacity]', with: '')
    choose('auditorium_is_imax_auditorium_false')
    click_button('Update Auditorium')

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")
    expect(page).to have_content("North 1")
    expect(page).to have_content("Capacity: 50")
    expect(page).to have_content("IMAX Auditorium: No")

    click_link("Edit Auditorium")
    fill_in('auditorium[name]', with: '')
    fill_in('auditorium[capacity]', with: '75')
    choose('auditorium_is_imax_auditorium_false')
    click_button('Update Auditorium')

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")
    expect(page).to have_content("North 1")
    expect(page).to have_content("Capacity: 75")
    expect(page).to have_content("IMAX Auditorium: No")
  end

  it 'I can update an auditorium but capacity is not changed if empty' do
    Auditorium.destroy_all

    auditorium_1 = Auditorium.create( name: "North 1",
                                      capacity: 50,
                                      is_imax_auditorium: true)
    visit "/auditoriums"

    click_link("North 1")
    click_link("Edit Auditorium")
    fill_in('auditorium[capacity]', with: '')
    choose('auditorium_is_imax_auditorium_false')
    click_button('Update Auditorium')

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")
    expect(page).to have_content("North 1")
    expect(page).to have_content("Capacity: 50")
    expect(page).to have_content("IMAX Auditorium: No")

    click_link("Edit Auditorium")
    fill_in('auditorium[name]', with: 'North 2')
    fill_in('auditorium[capacity]', with: '')
    choose('auditorium_is_imax_auditorium_true')
    click_button('Update Auditorium')

    expect(current_path).to eq("/auditoriums/#{auditorium_1.id}")
    expect(page).to have_content("North 2")
    expect(page).to have_content("Capacity: 50")
    expect(page).to have_content("IMAX Auditorium: Yes")
  end
end
