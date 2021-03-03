library(ggplot2)
library(dplyr)
library(pathlibr)
output_path <- function(filename){
  path <- paste("data/集計/", filename, sep="")
  return(path)
}
#### データ読み込み ####
df <- read.csv(
  "data/input/train.csv",
  na.strings=(c("NA", ""))
)



#### 可視化 ####
# 要約統計量
write.csv(
  summary(df),
  output_path("df_summary.csv"),
  quote=F
)

# 欠損一覧
write.csv(
  sapply(df, function(y) sum(is.na(y))),
  output_path("欠損数.csv"),
  quote=F
)

# ヒストグラム
g <- ggplot(df, aes(x=Age)) + geom_histogram(bins=20)
write.csv(
  ggplot_build(g)$data,
  output_path("Age_hist.csv"),
  quote=F
)

length(unique(df$Cabin))
