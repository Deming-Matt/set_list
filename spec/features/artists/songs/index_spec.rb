require 'rails_helper'

RSpec.describe "Artists songs index" do
  before :each do
    @zac_brown_band = Artist.create!(name: "Zac Brown Band")
    @toes = @zac_brown_band.songs.create!(title: "Toes", length: 345, play_count: 7654321)
    @colorado = @zac_brown_band.songs.create!(title: "Colorado", length: 825, play_count: 9814256)

  end
  it "shows all the titles of the songs for the artist" do

    visit "/artists/#{@zac_brown_band.id}/songs"

    expect(page).to have_content(@toes.title)
    expect(page).to have_content(@colorado.title)
  end

  it "links to each songs show page" do
    visit "/artists/#{@zac_brown_band.id}/songs"

    click_on @toes.title

    expect(current_path).to eq("/songs/#{@toes.id}")
  end

  it "shows the average song length for the artist" do
    visit "/artists/#{@zac_brown_band.id}/songs"

    expect(page).to have_content("Average song length for Zac Brown Band: 585.0")
  end
end
