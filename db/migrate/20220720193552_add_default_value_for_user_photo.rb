class AddDefaultValueForUserPhoto < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :string, default: 'https://w7.pngwing.com/pngs/831/88/png-transparent-user-profile-computer-icons-user-interface-mystique-miscellaneous-user-interface-design-smile-thumbnail.png'
  end
end
