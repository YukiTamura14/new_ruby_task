class Player
  def hand
    puts <<-TEXT
    数字を入力してください。
    0: グー
    1: チョキ
    2:  パー
    TEXT

    player_hand = gets.to_i #値を選択
    return player_hand

  end
end

class Enemy
  def hand
    enemy_hand = rand(3) #ランダムで値を取得
    return enemy_hand
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    #0~2以外の数値の場合の処理
    if player_hand < 0 || player_hand > 2
      puts "『0〜2』の数字を入力してください。"
      return janken_game
    end

    jankens = ["グー","チョキ","パー"]
    puts "あなたは『#{jankens[player_hand]}』を選びました"

    judge = (player_hand - enemy_hand + 3)%3
    if  judge == 0
      puts "相手も『#{jankens[enemy_hand]}』を選びました。あいこです！"
      puts "あいこで......"
      return janken_game

    elsif judge == 2
      puts "相手は『#{jankens[enemy_hand]}』を選びました。あなたの勝ちです！"

    else judge == 1
      puts "相手は『#{jankens[enemy_hand]}』を選びました。あなたの負けです！"
    end
  end
end

#じゃんけんの一連の流れをメソッド化
def janken_game
  player = Player.new #player側の
  enemy = Enemy.new
  janken = Janken.new

  janken.pon(player.hand, enemy.hand)
end

janken_game
