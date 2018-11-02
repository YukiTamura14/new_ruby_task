# コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
class Player
  def hand
    puts "数字を入力してください。"
    puts "0: グー"
    puts "1: パー"
    puts "2: チョキ"
    puts "じゃんけん・・・"

    gets.chop.to_i
  end
end

# グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
class Enemy
  def hand
    rand(3)
  end
end

class Janken
  HAND = ['グー','チョキ','パー']
  def pon(janken, player_hand, enemy_hand)
    if [0, 1, 2].include?(player_hand)
      judge =(enemy_hand - player_hand + 3) % 3
      puts "あなたの手は#{HAND[player_hand]}, わたしの手は#{HAND[enemy_hand]}"
      if judge == 0
        puts "あいこで..."
        janken = Janken.new
        janken.pon(janken, Player.new.hand, Enemy.new.hand)
      elsif judge == 1
        puts "あたなの勝ちです"
      else judge == 2
        puts "あなたの負けです"
      end
    else
      puts "０から2を入力してください"
      janken.pon(janken, Player.new.hand, Enemy.new.hand)
    end
  end
end

# class Playerの振る舞いを持ったインスタンスを生成する。こうすることで、playerと言う名前の変数にPlayerクラスに定義されているメソッドをplayerが使えるようになる。
# Playerはクラス、playerはローカル変数
player = Player.new
enemy = Enemy.new
janken = Janken.new
# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(janken, player.hand, enemy.hand)
