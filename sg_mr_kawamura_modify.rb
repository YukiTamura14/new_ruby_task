class Player
  def initialize(in_, out)
    @in = in_
    @out = out
  end

  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    @out.puts "数字を入力してください"
    @out.puts "0: グー"
    @out.puts "1: チョキ"
    @out.puts "2: パー"
    h = input_hand.chomp
    if !%w[0 1 2].include?(h)
      raise "0〜2の数字を入力してください"
    end
    h.to_i
  end

  def input_hand
    @in.gets
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    [0, 1, 2].sample
  end
end

class Janken
  def initialize(in_, out)
    @in = in_
    @out = out
  end

  def pon(player_hand, enemy_hand)
    judge = ((player_hand.to_i - enemy_hand.to_i) + 3) % 3

    if judge == 2
      @out.puts "相手の手は#{Choice[enemy_hand]}です。あなたの勝ちです。"
      true
    elsif judge == 1
      @out.puts "相手の手は#{Choice[enemy_hand]}です。あなたの負けです。"
      true
    else
      @out.puts "相手の手は#{Choice[enemy_hand]}です。引き分けです。"
      false
    end
  end
end

Choice = {0 => 'グー', 1 => 'チョキ', 2 => 'パー'}

in_ = STDIN
out = STDOUT

player = Player.new(in_, out)
enemy = Enemy.new
janken = Janken.new(in_, out)

# 下記の記述で、ジャンケンメソッドが起動される
end_game = false
while !end_game
  end_game = janken.pon(player.hand, enemy.hand)
end
