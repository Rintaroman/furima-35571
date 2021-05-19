FactoryBot.define do
  factory :furima do
    product               {'samp'}
    content               {'samp'}
    price                 {'1000'}
    category_id           {'2'}
    condition_id          {'2'}
    delivery_charge_id    {'2'}
    prefecture_id         {'28'}
    time_required_id      {'2'}
    

    after(:build) do |furima|
      furima.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
