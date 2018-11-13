require_relative '../../app.rb'

feature "hitpoints" do
  scenario "opponents hit points show" do
    sign_in_and_play
    expect(page).to have_content "Kirill: 60HP Chris: 60HP"
  end

  scenario "can attack" do
    sign_in_and_play
    expect(page).to have_selector("input[type=submit][value='Attack']")
  end

  scenario "attack confirmed" do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Kirill attacked Chris'
  end
end
