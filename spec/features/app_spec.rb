require_relative '../../app.rb'

feature "prints some words" do
  scenario "on homepage" do
    visit("/")
    expect(page).to have_content("Testing insfrastructure is as clear as London weather")
  end
end

feature "gets names and displays them" do
  scenario "Player 1 on the homepage" do
    visit("/")
    expect(page).to have_field('P1:')
  end
  scenario "Player 2 on the homepage" do
    visit("/")
    expect(page).to have_field('P2:')
  end
end
