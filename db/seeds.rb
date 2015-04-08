# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
r1 = Role.create({name: "Tier 2 Manufacturers", description: "Can read and create records. Can update and destroy own records"})
r2 = Role.create({name: "Distributor", description: "Can read and create records. Can update and destroy own records"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

 
u1 = User.create({name: "Sally", last_name: "Jones", email: "sally@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u2 = User.create({name: "Sue", last_name: "Micheal", email: "sue@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u3 = User.create({name: "Kev", last_name: "Steve", email: "kev@example.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u4 = User.create({name: "Jay", last_name: "Xu", email: "sgliv8@gmail.com", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
u4 = User.create({name: "Bill", last_name: "Keough", email: "wkeough@uw.edu", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
 
i1 = Record.create({round: 1, begin_cash: 100000.00, expenses: 60000.00, revenue: 90000.00, inventory_penalty: 2000.00, order_penalty: 1000.00, end_cash: 127000.00, user_id: u1.id})
i2 = Record.create({round: 2, begin_cash: 127000.00, expenses: 60000.00, revenue: 90000.00, inventory_penalty: 2000.00, order_penalty: 1000.00, end_cash: 154000.00, user_id: u1.id})
