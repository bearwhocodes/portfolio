class AddInitialUser < ActiveRecord::Migration[5.1]
  def change
    User.create! email: ENV['STEVE_EMAIL'], password: ENV['STEVE_PASSWORD']
  end
end
