require 'rails_helper'

RSpec.describe 'When I visit auditoriums index', type: :feature do

  it 'I can add a new auditorium that displays a form with name, capacity, and IMAX fields' do
    visit "/auditoriums"
    click_link("New Auditorium")

    expect(current_path).to eq("/auditoriums/new")
    expect(page).to have_content("Create a new auditorium:")
    expect(page).to have_content("Name: ")
    expect(page).to have_content("Capacity: ")
    expect(page).to have_content("IMAX Auditorium: ")
    expect(page).to have_content("Required field")
  end

  it 'I can create a new auditorium' do
    visit "/auditoriums"
    click_link("New Auditorium")

    expect(current_path).to eq("/auditoriums/new")

    fill_in('auditorium[name]', with: 'South 1')
    fill_in('auditorium[capacity]', with: '100')
    choose('true')
    click_button('Create Auditorium')

    expect(page).to have_content('South 1')
  end

  it 'I cannot create new auditorium when name or capacity are empty' do
    visit "/auditoriums"
    click_link("New Auditorium")

    expect(current_path).to eq("/auditoriums/new")

    choose('true')
    click_button('Create Auditorium')

    expect(page).to have_content("Auditorium not created: Required information missing.")
    expect(page).to have_button('Create Auditorium')

    fill_in('auditorium[capacity]', with: '100')
    choose('true')
    click_button('Create Auditorium')

    expect(page).to have_content("Auditorium not created: Required information missing.")
    expect(page).to have_button('Create Auditorium')

    fill_in('auditorium[name]', with: 'South 2')
    choose('true')
    click_button('Create Auditorium')

    expect(page).to have_content("Auditorium not created: Required information missing.")
    expect(page).to have_button('Create Auditorium')
  end

  it 'I can create auditorium when IMAX Auditorium radio is not selected' do
    visit '/auditoriums/new'

    fill_in('auditorium[name]', with: 'South 2')
    fill_in('auditorium[capacity]', with: '25')
    click_button('Create Auditorium')

    expect(page).to have_content('South 2')
    click_link("South 2")

    expect(page).to have_content('IMAX Auditorium: No')
  end
end
