data {
  # データの個数とデータ本体の宣言
  int N;
  real Y[N]; # 実数値がが入るN個の配列
}

parameters {
  real mu;
}

model {
  for (n in 1:N) {
    Y[n] ~ normal(mu, 1); # 尤度
  }
  mu ~ normal(0, 100); # 無情報事前分布
}