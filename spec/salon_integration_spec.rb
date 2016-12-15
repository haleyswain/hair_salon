require('spec_helper')
require('pry')

  describe('adding a stylist', {:type => :feature}) do
    it('gathers the user stylist input and displays it in the list of stylists') do
      visit('/stylist_list')
      fill_in('new-stylist', :with => 'hairdresser')
      click_button('Add a new stylist')
      expect(page).to have_content('hairdresser')
    end
  end



describe('the adding a client to a stylist', {:type => :feature}) do
  it('gathers the user client input in the index page, and displays it in the list of clients, as well as the page with its specific stylist') do
    visit('/stylist_list')
    fill_in('new-stylist', :with => 'haley')
    click_button('Add a new stylist')
    expect(page).to have_content('haley')
    click_link("haley")
    expect(page).to have_content('haley doesnt have any clients yet! Add your name below!')
    fill_in('name', :with => "murphy")
    click_button('Add New Client')
    expect(page).to have_content("murphy")
  end
end

describe('deleting a stylist', {:type => :feature}) do
  it('removes the users stylist input from the salon') do
    visit('/stylist_list')
    fill_in('new-stylist', :with => 'haley')
    click_button('Add a new stylist')
    expect(page).to have_content('haley')
    click_link("haley")
    expect(page).to have_content('Remove haley')
    click_button('Delete this stylist')
    expect(page).not_to have_content('haley')
  end
end

describe('editing a stylist', {:type => :feature}) do
  it('changes the name of a stylist') do
    visit('/stylist_list')
    fill_in('new-stylist', :with => 'haley')
    click_button('Add a new stylist')
    expect(page).to have_content('haley')
    click_link("haley")
    expect(page).to have_content('Edit haleys Name')
    fill_in('edit_stylist', :with => 'santa')
    click_button('Edit Name')
    expect(page).to have_content('santa')
  end
end
