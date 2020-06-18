library(readr)
library(dplyr)
library(plyr)
library(tidyverse)

transfers_all <- read_csv("data/transfers-all.csv")
top250 <- read_csv("data/top250-00-19.csv")
top250$type <- "Purchase"

options(scipen = 999)

#transform all prices in transfers_all to euros and without k/m, only for purchases
purchases <- transfers_all[grep("^?", transfers_all$transferFee),]

purchases$fee <- as.numeric(gsub("[?km]", "", purchases$transferFee))
k.index          <- substr(purchases$transferFee, nchar(purchases$transferFee), nchar(purchases$transferFee)) == 'k'
purchases$fee[k.index] <- purchases$fee[k.index] * 1116.56
m.index          <- substr(purchases$transferFee, nchar(purchases$transferFee), nchar(purchases$transferFee)) == 'm'
purchases$fee[m.index] <- purchases$fee[m.index] * 1116555.09

purchases <- subset(purchases, select = -c(transferFee))

purchases$type <-"Purchase"

#same but for loan
loans <- transfers_all[grep("Loan fee:", transfers_all$transferFee),]

stopwords = c("Loan","fee:","?","m","k")

loans$fee <- as.numeric(gsub(paste0(stopwords,collapse = "|"),"", loans$transferFee))
k.index          <- substr(loans$transferFee, nchar(loans$transferFee), nchar(loans$transferFee)) == 'k'
loans$fee[k.index] <- loans$fee[k.index] * 1116.56
m.index          <- substr(loans$transferFee, nchar(loans$transferFee), nchar(loans$transferFee)) == 'm'
loans$fee[m.index] <- loans$fee[m.index] * 1116555.09

loans <- subset(loans, select = -c(transferFee))

loans$type <-"Loan"

#free transfer dataset

free <- transfers_all[grep("Free [Tt]ransfer", transfers_all$transferFee),]
free$fee = 0

free <- subset(free, select = -c(transferFee))
free$type <-"Free Transfer"

#gratis loan dataset

gratis_loan <- transfers_all[grep("^Loan$", transfers_all$transferFee),]
gratis_loan$fee = 0

gratis_loan <- subset(gratis_loan, select = -c(transferFee))
gratis_loan$type <-"Gratis Loan"

#All the others data have no fee, so we decided to discard them
df <- do.call("rbind", list(purchases, free, loans, gratis_loan))



####################################################
####################################################
####################################################
#We allign the transfer_all schema to the top250 one
####################################################
####################################################
####################################################

df <- subset(df, select = -c(playerUri,sellerClubUri, buyerClubUri, transferUri,timestamp ))
df$season <-gsub("/","-",df$season)


colnames(df) <- c("Season", "Name", "Position", "Age", "Team_from", "League_from","Team_to", "League_to","Player_image","Player_nationality", "Transfer_fee","type")
df <- df[c("Name","Position","Age","Team_from","League_from","Team_to","League_to","Season","Transfer_fee","type","Player_image","Player_nationality")]


#impossible to allign league_from: on join we stay with df league.


df <-na.omit(df,cols("Team_from","Team_to", "League_from","League_to","Transfer_fee","Player_image","Player_nationality"))

sum(is.na(df))
sum(is.na(top250))
sum(is.na(top250$Market_value))


inner  <- merge(df, top250, by = c("Name", "Team_from", "Team_to","Season"), all = FALSE)

inner <- subset(inner, select = -c(Position.y,Age.y,League_from.y,League_to.y,Transfer_fee.y,type.y))

colnames(inner) <-c("Name","Team_from","Team_to","Position","Age","League_from","League_to","Season","Transfer_fee","type","Player_image","Player_nationality","Market_value")

inner <- tibble::rowid_to_column(inner, "ID")

write.csv(inner,'data/transfers.csv')

