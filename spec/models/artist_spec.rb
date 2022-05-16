require 'rails_helper'

RSpec.describe Artist, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it {should have_many :songs}
  end

  describe "instance methods" do
    describe "#average_song_length" do
      before :each do
        @zac_brown_band = Artist.create!(name: "Zac Brown Band")
        @toes = @zac_brown_band.songs.create!(title: "Toes", length: 345, play_count: 7654321)
        @colorado = @zac_brown_band.songs.create!(title: "Colorado", length: 825, play_count: 9814256)
        @truckin = @zac_brown_band.songs.create!(title: "Truckin", length: 1, play_count: 42)

      end

      it "returns the average song length" do
        expect(@zac_brown_band.average_song_length.round(2)).to eq(390.33)
      end
    end
  end
end
