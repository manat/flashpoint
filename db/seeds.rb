vertigo_cells = []
vertigo_cells << Cell.new(name: '1')
vertigo_cells << Cell.new(name: '2')
vertigo_cells << MotionCell.new(name: '3') #forward
vertigo_cells << Cell.new(name: '4')
vertigo_cells << Cell.new(name: '5')
vertigo_cells << MotionCell.new(name: '6') #forward
vertigo_cells << Cell.new(name: '7')
vertigo_cells << DetentionCell.new(name: '8', turn: 1)
vertigo_cells << DetentionCell.new(name: '9', turn: 3)
vertigo_cells << MotionCell.new(name: '10') #forward
vertigo_cells += (11..13).map { |i| Cell.new(name: "#{i}") }
vertigo_cells << MotionCell.new(name: '14') #backward
vertigo_cells << Cell.new(name: '15')
vertigo_cells << Cell.new(name: '16')
vertigo_cells << MotionCell.new(name: '17') #backward
vertigo_cells += (18..24).map { |i| Cell.new(name: "#{i}") }
vertigo_cells << DetentionCell.new(name: '25', turn: 1)
vertigo_cells << MotionCell.new(name: '26') #forward
vertigo_cells << Cell.new(name: '27')
vertigo_cells << Cell.new(name: '28')
vertigo_cells << MotionCell.new(name: '29') #forward
vertigo_cells += (30..32).map { |i| Cell.new(name: "#{i}") }
vertigo_cells << MotionCell.new(name: '33') #backward
vertigo_cells << Cell.new(name: '34')
vertigo_cells << MotionCell.new(name: '35') #forward
vertigo_cells += (36..38).map { |i| Cell.new(name: "#{i}") }
vertigo_cells << DetentionCell.new(name: '39', turn: 2)
vertigo_cells << Cell.new(name: '40') # END!

# Define MotionCell's destination
vertigo_cells[2].destination = vertigo_cells[4]
vertigo_cells[5].destination = vertigo_cells[7]
vertigo_cells[9].destination = vertigo_cells[11]
vertigo_cells[13].destination = vertigo_cells[10]
vertigo_cells[16].destination = vertigo_cells[6]
vertigo_cells[25].destination = vertigo_cells[28]
vertigo_cells[28].destination = vertigo_cells[31]
vertigo_cells[32].destination = vertigo_cells[22]
vertigo_cells[34].destination = vertigo_cells[38]

vertigo = Board.create(
            name: 'Vertigo', 
            description: 'Path to a different earth, where reality is based on recollection of ...', 
            cells: vertigo_cells)


game_demo = Game.create(board: vertigo)


