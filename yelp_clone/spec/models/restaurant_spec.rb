require 'spec_helper'

describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews}
end

describe Restaurant, type: :model do
  let(:kfc) {Restaurant.create(name: 'KFC' )}
  it "deletes associated reviews when deleting a restaurant" do
    review = Review.create(thoughts: 'test review', rating: 3, restaurant_id: kfc.id)
    kfc.save
    expect{kfc.destroy}.to change(Review, :count).by(-1)
    expect{Review.find(review.id)}.to raise_error "Couldn't find Review with 'id'=#{review.id}" 
  end
end
