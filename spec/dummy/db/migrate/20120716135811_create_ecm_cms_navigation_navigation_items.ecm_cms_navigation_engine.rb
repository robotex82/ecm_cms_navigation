# This migration comes from ecm_cms_navigation_engine (originally 2)
class CreateEcmCmsNavigationNavigationItems < ActiveRecord::Migration
  def change
    create_table :ecm_cms_navigation_navigation_items do |t|
      t.string :key
      t.string :name
      t.string :url
      t.string :options
      
      # references
      t.references :navigation
      
      # awesome nested set
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :children_count      
      
      # friendy id
      t.string :slug

      t.timestamps
    end
  end
end
