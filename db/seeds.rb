# Settings
Setting.new({ name: 'title', value: 'Milestone' }).save

# Groups
Usergroup.new({ name: 'Admin', is_admin: true }).save
Usergroup.new({ name: 'User',  is_admin: false }).save
