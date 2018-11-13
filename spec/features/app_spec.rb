require_relative '../../app.rb'

feature "gets and displays players name" do
  scenario "players enter names" do
    sign_in_and_play
    expect(page).to have_content "Kirill VS. Chris"
  end
end
