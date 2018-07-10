require 'src/Game.rb'

class Client < Game
  #finalizer :shutdown
  def initialize
    super
    @socket = TCPSocket.new("localhost", 28888)
    #188.222.55.241

    while @player.nil?
      @player = Player.new(@socket.recv(1024))
      puts @player
      puts @player.getUser()
      @player.warp(0, 0)
      pulse
    end
  end

  def pulse
    Thread.new{
      loop{
        msg = @player.getUser() + "|" + "#{@player.getX()}" + "|" + "#{@player.getY()}"
        @socket.write(msg)
      }

    }
    Thread.new{
      loop{
        msg = @socket.recv(30)
        data = msg.split"|"
        if @players.include? data[0]
          @players.each do |player|
            if player.getUser() == data[0]
              player.setX(data[1])
              player.setY(data[2])
            end
          end
        else
          p = Player.new(data[0])
          p.warp(data[1],data[2])
          @players.push(p)
        end
      }
    }
  end

  Client.new.show

end