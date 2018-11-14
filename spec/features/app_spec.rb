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
    attack_confirm
    expect(page).not_to have_content "Kirill's turn"
    expect(page).to have_content "Chris's turn"
  end

  scenario 'reduce Player 1 HP by 10' do
    sign_in_and_play
    2.times { attack_confirm }
    expect(page).not_to have_content 'Chris: 60HP'
    expect(page).to have_content 'Chris: 50HP'
  end

  scenario "gets told when HP hits 0" do
    sign_in_and_play
    10.times { attack_confirm }
    click_button 'Attack'
    expect(page).to have_content 'Chris lost'
  end
end
