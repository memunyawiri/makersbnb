feature 'Booking request' do
  scenario 'I can navigate to Book a Space' do
    list_space
    visit('/bookings')
    expect(page.status_code).to eq 200
  end
end
