# coding: utf-8

User.create!(
  [
    {
      name: "管理者",
      email: "sample-1@email.com",
      password: "password",
      password_confirmation: "password"
    },
    {
      name: "上長1",
      email: "sample-2@email.com",
      affiliation: "上長",
      password: "password",
      password_confirmation: "password"
    },
    {
      name: "上長2",
      email: "sample-3@email.com",
      affiliation: "上長",
      password: "password",
      password_confirmation: "password"
    },
    {
      name: "一般1",
      email: "sample-4@email.com",
      affiliation: "一般",
      password: "password",
      password_confirmation: "password"
    },
    { 
      name: "一般2",
      email: "sample-5@email.com",
      affiliation: "一般",
      password: "password",
      password_confirmation: "password"
    }
  ]
)