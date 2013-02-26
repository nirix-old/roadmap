
# Settings
settings = DB[:settings]
settings.insert({ setting: 'title',    value: 'Roadmap', type: 'text' })
settings.insert({ setting: 'language', value: 'enAU',    type: 'language_select' })
settings.insert({ setting: 'theme',    value: 'Default', type: 'theme_select' })

# Groups
groups = DB[:groups]
groups.insert({ name: 'Admin',      is_admin: true })
groups.insert({ name: 'Registered', is_admin: false })

# Permissions
permissions = DB[:permissions]
permissions.insert({ project_id: 0, context: 'Group', context_id: 0, action: 'view', value: true })
