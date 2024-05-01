BASEPATH <- 'https://raw.githubusercontent.com/mark-andrews/idvrug24/main/data/'

remote_read_csv <- function(filename){
  readr::read_csv(stringr::str_c(BASEPATH, filename, sep = '/'))
}

data_df <- remote_read_csv("data_df.csv")
weight_df <- remote_read_csv("weight.csv")
titanic_df <- remote_read_csv("TitanicSurvival.csv")
nott_df <- remote_read_csv("nottingham_temp.csv")
map_data <- remote_read_csv("local_authority_map_data.csv")
eu_ref <- remote_read_csv("EU-referendum-result-data.csv")
swiss_df <- remote_read_csv("swiss_df.csv")
