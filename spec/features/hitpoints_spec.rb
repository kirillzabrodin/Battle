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

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_button 'Attack'
    click_button 'OK'
    expect(page).not_to have_content 'Chris: 60HP'
    expect(page).to have_content 'Chris: 50HP'
  end
end
