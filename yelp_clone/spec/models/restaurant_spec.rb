require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews}
end

describe Restaurant, type: :model do
  let(:kfc) {Restaurant.create(name: 'KFC' )}
  it "deletes associated reviews when deleting a restaurant" do
    review = Review.create(thoughts: 'test review', rating: 3, restaurant_id: kfc.id)
    expect{kfc.destroy}.to change(Review, :count).by(-1)
    expect{Review.find(review.id)}.to raise_error "Couldn't find Review with 'id'=#{review.id}"
  end
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end
