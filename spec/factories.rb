FactoryGirl.define do

  factory :discussion_thread do
    title         "Lorem ipsum"
    text          "This is discussion thread text."
  end

  factory :discussion_url_thread, class: DiscussionThread do
    title         "Check out google page"
    url           "https://www.google.pl/"
  end
end