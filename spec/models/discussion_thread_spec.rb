require 'rails_helper'

RSpec.describe DiscussionThread, :type => :model do

  # Title validation part
  it 'is valid when title is correct' do
    valid_title = [
        'Hello friends',
        'This is my new robot!',
        'Guess what happened..',
        'Check out new google\'s logo'
    ]
    valid_title.each do |valid_title|
      valid_discussion_thread = build(:discussion_thread, title: valid_title)
      valid_discussion_url_thread = build(:discussion_thread, title: valid_title)

      expect(valid_discussion_thread).to be_valid
      expect(valid_discussion_url_thread).to be_valid
    end
  end

  it 'is invalid when title is not presence' do
    invalid_titles = ["", "    "]
    invalid_titles.each do |invalid_title|
      invalid_discussion_thread = build(:discussion_thread, title: invalid_title)
      expect(invalid_discussion_thread).not_to be_valid
    end
  end

  it 'is invalid when title length is over 300 characters' do
    invalid_title = 'a' * 301
    invalid_discussion_thread = build(:discussion_thread, title: invalid_title)
    expect(invalid_discussion_thread).not_to be_valid
  end

  it 'is invalid when title contain url' do
    urls = [
        'https://www.reddit.com/',
        'https://www.google.com',
        'http://www.bing.com/',
        'google.com',
    ]
    urls.each do |url|
      invalid_title = 'Check out: ' + url
      invalid_discussion_thread = build(:discussion_thread, title: invalid_title)
      expect(invalid_discussion_thread).not_to be_valid
    end
  end

  # Text validation part
  it 'is invalid when text length over 5000' do
    invalid_text = 'a' * 5001
    invalid_discussion_thread = build(:discussion_thread, text: invalid_text)
    expect(invalid_discussion_thread).not_to be_valid
  end

  # Type validation part
  it 'is invalid when post_type is other than \'text\' or \'url\'' do
    invalid_post_types = ['dog', 'cat']
    invalid_post_types.each do |invalid_post_type|
      invalid_discussion_thread = build(:discussion_thread, post_type: invalid_post_type)
      expect(invalid_discussion_thread).not_to be_valid
    end
  end

  context 'thread is link post' do

    it 'is invalid when url is not an url' do
      invalid_url = [
          'Castle',
          'x.iamnotalink',
          'not.alink'
      ]
      invalid_url.each do |invalid_url|
        invalid_url_discussion_thread = build(:discussion_url_thread, url: invalid_url)
        expect(invalid_url_discussion_thread).not_to be_valid
      end
    end

    it 'is invalid when url is not presence' do
      invalid_url = [
          '',
          '   '
      ]
      invalid_url.each do |invalid_url|
        invalid_url_discussion_thread = build(:discussion_url_thread, url: invalid_url)
        expect(invalid_url_discussion_thread).not_to be_valid
      end
    end

    it 'is invalid when text is given' do
      invalid_url_discussion_thread = build(:discussion_url_thread, text: 'Lorem ipsum')
      expect(invalid_url_discussion_thread).not_to be_valid
    end
  end

  context 'thread is url post' do
    it 'is invalid when url is given' do
      invalid_url_discussion_thread = build(:discussion_thread, url: 'https://www.reddit.com/')
      expect(invalid_url_discussion_thread).not_to be_valid
    end
  end
end
