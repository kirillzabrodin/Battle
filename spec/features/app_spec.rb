require_relative '../../app.rb'

feature "gets and displays players name" do
  scenario "players enter names" do
    sign_in_and_play
    expect(page).to have_content "Kirill VS. Chris"
  end
end

feature "can switch turns" do
  scenario "switch from p1 to p2" do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Kirill: 60HP'
    expect(page).to have_content 'Kirill: 50HP'
  end
end
