describe 'discussion_thread/index.html.haml' do

  it 'displays the thread title' do
      assign(:discussion_threads, [
          build(:discussion_thread, title: "Lorem"),
          build(:discussion_thread, title: "Ipsum")
      ])
      render

      expect(rendered).to match /Lorem/
      expect(rendered).to match /Ipsum/
  end
end