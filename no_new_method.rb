$stdout.sync = true

HAND_ARRAY = ['グー', 'チョキ', 'パー']

class Player
  ERROR = -1

  def hand
    puts '数字を入力してください'
    HAND_ARRAY.each_with_index do |x, i|
      puts "#{i}: #{x}"
    end

    input = gets.chomp
    if input !~ /^[0-2]{1}$/
      ERROR
    end
    input.to_i
  end
end

class Enemy
  def hand
    rand(HAND_ARRAY.length)
  end
end

class Janken
  def pon(player, enemy)
    player_hand = player.hand
    enemy_hand = enemy.hand
    win_or_lose = (player_hand - enemy_hand + 3) % 3

    if player_hand == Player::ERROR || win_or_lose == 0
      if player_hand == Player::ERROR
        puts "0〜2の数字を入力してください。"
      else
        puts "相手の手は#{HAND_ARRAY[enemy_hand]}です。あいこです。"
      end

      # player = Player.new
      # enemy = Enemy.new
      # janken = Janken.new
      self.pon(player, enemy)
    elsif win_or_lose == 1
      puts "相手の手は#{HAND_ARRAY[enemy_hand]}です。あなたの負けです。"
    else
      puts "相手の手は#{HAND_ARRAY[enemy_hand]}です。あなたの勝ちです。"
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new
janken.pon(player, enemy)
