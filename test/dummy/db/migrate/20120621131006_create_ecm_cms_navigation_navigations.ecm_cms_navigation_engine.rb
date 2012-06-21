# This migration comes from ecm_cms_navigation_engine (originally 1)
class CreateEcmCmsNavigationNavigations < ActiveRecord::Migration
  def change
    create_table :ecm_cms_navigation_navigations do |t|
      t.string :locale
      t.string :name

      t.timestamps
    end
  end
end
