class AddBottomLinkToStaticPageData < ActiveRecord::Migration
  def change
    add_column :static_page_data, :next_page_link, :text
    add_column :object_metadata, :next_page_link, :text
  end
end
