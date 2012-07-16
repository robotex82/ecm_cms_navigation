class CreateEcmCmsNavigationNavigations < ActiveRecord::Migration
  def change
    create_table :ecm_cms_navigation_navigations do |t|
      t.string :locale
      t.string :name
      
      # friendy id
      t.string :slug

      t.timestamps
    end
  end
end
