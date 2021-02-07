require 'rails_helper'

RSpec.describe 'auditoriums new page', type: :feature do

  it 'can display form for name, capacity, IMAX auditorium fields' do
    visit '/auditoriums/new'

    expect(page).to have_content("Enter a new auditorium:")
    expect(page).to have_content("Name: ")
    expect(page).to have_content("Capacity: ")
    expect(page).to have_content("IMAX Auditorium: ")
    expect(page).to have_content("Required field")
  end

  it 'creates a new auditorium' do
    visit '/auditoriums/new'

    fill_in('auditorium[name]', with: 'South 1')
    fill_in('auditorium[capacity]', with: '100')
    choose('true')
    click_button('Create Auditorium')
    save_and_open_page

    expect(page).to have_content('South 1')
  end

  it 'does not create new auditorium when name or capacity are empty' do
    visit '/auditoriums/new'

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

  it 'creates auditorium when is_imax_auditorium as false when not selected' do
    visit '/auditoriums/new'

    fill_in('auditorium[name]', with: 'South 2')
    fill_in('auditorium[capacity]', with: '25')
    click_button('Create Auditorium')
    save_and_open_page

    expect(page).to have_content('South 2')
  end
end
