# Settings
Setting.new({ name: 'title', value: 'Milestone' }).save

# Groups
Group.new({ name: 'Admin', is_admin: true }).save
Group.new({ name: 'User',  is_admin: false }).save
