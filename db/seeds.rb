# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cell = Cell.create(name: 'Origin')

forwardCell = MotionCell.create(name: 'Go Forward', destination: cell)
backwardCell = MotionCell.create(name: 'Go Backward', destination: cell)
jumpCell = MotionCell.create(name: 'Jump Forward', destination: forwardCell)

detentionCell = DetentionCell.create(name: 'Junta', turn: 30)

novice = Player.create(name: 'Novice')
pro = Player.create(name: 'Pro', cell: jumpCell)
