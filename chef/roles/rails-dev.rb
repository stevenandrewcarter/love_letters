name 'rails-dev'
description 'setup for ruby on rails core development'
run_list(
    'recipe[apt]',
    'recipe[git]',
    'recipe[sqlite]',
    'recipe[nodejs::install_from_binary]',
    'recipe[ruby_build]',
    'recipe[rbenv::system]',
    'recipe[rbenv::vagrant]',
    'recipe[postinstall]'
)