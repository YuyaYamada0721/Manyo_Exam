FactoryBot.define do
  factory :label do
    name { 'Ruby' }
  end
  factory :label2, class: Label do
    name { 'Java' }
  end
end
