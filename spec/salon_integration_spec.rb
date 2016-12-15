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



describe('the client path', {:type => :feature}) do
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
