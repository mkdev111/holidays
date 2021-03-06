# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts '*** Destroying existing data'
User.destroy_all
PublicHoliday.destroy_all

puts '*** Creating users'
User.create(email: 'admin@diacode.com', password: '12345678', first_name: 'admin', last_name: 'istrator', admin: true)
User.create(email: 'user@diacode.com', password: '12345678', first_name: 'regular', last_name: 'user')

puts '*** Creating public holidays'
public_holidays = [
  {
    name: 'Año Nuevo',
    day: '2015-01-01'
  },
  {
    name: 'Epifanía del Señor',
    day: '2015-01-06'
  },
  {
    name: 'Viernes Santo',
    day: '2015-04-03'
  },
  {
    name: 'Fiesta del Trabajo',
    day: '2015-05-01'
  },
  {
    name: 'Asunción de la Virgen',
    day: '2015-08-15'
  },
  {
    name: 'Fiesta Nacional de España',
    day: '2015-10-12'
  },
  {
    name: 'Inmaculada Concepción',
    day: '2015-12-08'
  },
  {
    name: 'Natividad del Señor',
    day: '2015-12-25'
  }
]

public_holidays.each { |holiday| PublicHoliday.create holiday }
