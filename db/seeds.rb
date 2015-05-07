User.find_or_create_by(
    email: 'admin@example.com',
    password_digest: BCrypt::Password.create('secret'),
    admin: true
)


Activity.create!([{resource: 'role', activity: 'index'},
                  {resource: 'role', activity: 'show'},
                  {resource: 'role', activity: 'create'},
                  {resource: 'role', activity: 'update'},
                  {resource: 'role', activity: 'delete'},
                  {resource: 'user', activity: 'index'},
                  {resource: 'user', activity: 'show'},
                  {resource: 'user', activity: 'create'},
                  {resource: 'user', activity: 'update'},
                  {resource: 'user', activity: 'delete'}
                 ])

Role.create!([{name: 'Manager user', activities: Activity.where(resource: 'user')},
              {name: 'Manager role', activities: Activity.where(resource: 'role')}
             ])

