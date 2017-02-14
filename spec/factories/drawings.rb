FactoryGirl.define do
  factory :drawing, :class => 'Drawing' do
    title "title"
    attachment {fixture_file_upload(Rails.root.join('spec/factories/files/squirrel.jpg'), 'image/jpg')}
  end
end