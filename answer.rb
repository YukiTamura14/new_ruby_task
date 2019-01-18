class Player
  def hand
    puts "数字を入力してください。"
    puts "0: グー"
    puts "1: パー"
    puts "2: チョキ"

    gets
  end
end

class Enemy
  def hand
    rand(0..2)
  end
end

class Janken
  def pon(janken, player, enemy)
    if ! ["0\n", "1\n", "2\n"].include?(player)
      puts "0〜2の数字を入力してください。"
      self.pon(janken, Player.new.hand, Enemy.new.hand)
    elsif (player.to_i - enemy.to_i + 3) % 3 == 2
      puts "相手の手は#{Choice[enemy]}です。あなたの勝ちです。"
    elsif (player.to_i - enemy.to_i + 3) % 3 == 1
      puts "相手の手は#{Choice[enemy]}です。あなたの負けです。"
    else
      puts "相手の手は#{Choice[enemy]}です。あいこです。"
      self.pon(janken, Player.new.hand, Enemy.new.hand)
    end
  end
end

Choice = {0 => "グー", 1 => "パー", 2 => "チョキ"}

player = Player.new
enemy = Enemy.new
janken = Janken.new

# janken.ponにjankenインスタンスを引数で渡すのではなく、ponメソッドの中でJanken.newをする形でも良い
janken.pon(janken, player.hand, enemy.hand)
