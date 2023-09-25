namespace :users do
  desc 'Create employee and employer user'
  task create_users: :environment do
    User.create(
      user_type: 4,
      email: 'job@gmail.com',
      password: Digest::MD5.hexdigest('NguyenBitcoinX10000'),
      confirm_password: Digest::MD5.hexdigest('NguyenBitcoinX10000')
    )

    User.create(
      user_type: 4,
      email: 'admin@devfinding.com',
      password: Digest::MD5.hexdigest('NguyenBitcoinX10000'),
      confirm_password: Digest::MD5.hexdigest('NguyenBitcoinX10000')
    )

  end
end
