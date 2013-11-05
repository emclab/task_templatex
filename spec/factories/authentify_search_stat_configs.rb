# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentify_search_stat_config, :class => 'SearchStatConfig' do
    resource_name "MyString"
    stat_function "MyText"
    labels_and_fields "MyText"
    search_results_url "MyString"
    search_where "MyText"
    include_stats false
    search_results_period_limit "MyText"
  end
end
