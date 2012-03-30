shared_examples_for 'data attributes sugar' do |input_type|
  context 'when data attributes are present' do
    before do
      concat(semantic_form_for(@new_post) do |builder|
        builder.input(:title, :as => input_type,
                      :input_html => {:id => 'with_data'},
                      :data => {:rails => '3.1'})
      end)
    end

    it 'adds a data attribute using Rails 3.1 syntactic sugar' do
      output_buffer.should have_tag('[data-rails="3.1"]')
    end
  end

  context 'when data attributes are not specified' do
    before do
      concat(semantic_form_for(@new_post) do |builder|
        builder.input(:title, :as => input_type,
                      :input_html => {:id => 'without_data'})
      end)
    end

    it 'adds a data attribute using Rails 3.1 syntactic sugar' do
      output_buffer.should_not have_tag('[data-rails="3.1"]')
    end
  end
end
