library(tidyverse)
library(readxl)
library(party)
library(vcd)
# library(lme4)

# load the concordance data in .xlsx (to keep updated) ======
conc <- read_xlsx("excel-data/memberi_memberikan_coded.xlsx")

# save the concordance into .txt and reload it
write.table(conc, file = "data/memberi_memberikan_coded.txt", sep = "\t", 
            quote = FALSE, row.names = FALSE)
conc <- read.table(file = 'data/memberi_memberikan_coded.txt', 
                   header = TRUE, sep = "\t", quote = "", 
                   comment.char = "", stringsAsFactors = TRUE)

# filter out only tokens for dative and double-object constructions for memberi ======
conc1 <- conc %>% 
  filter(SYNTAX %in% c("ditransitive", "dative"),
         is.na(TH_TYPE) # remove clausal theme
  ) |> 
  mutate(across(matches("^(SYNTAX|TH_TYPE)$"), fct_drop)) |> 
  mutate(NODE = fct_relabel(NODE,
                            ~str_replace(., "\\/.+$", ""))) |> 
  mutate(SYNTAX = fct_relevel(SYNTAX,
                              "ditransitive",
                              "dative")) |> 
  as_tibble() |> 
  select(-TRANSITIVE_OBJECT) |> 
  mutate(TH_DEF2 = as.character(TH_DEF),
         TH_DEF2 = if_else(TH_DEF2 == "0", "indefinite", "definite"),
         TH_DEF2 = factor(TH_DEF2, levels = c("definite", "indefinite")),
         REC_DEF2 = as.character(REC_DEF),
         REC_DEF2 = if_else(REC_DEF2 == "0", "indefinite", "definite"),
         REC_DEF2 = factor(REC_DEF2, levels = c("definite", "indefinite"))) |> 
  filter(NODE == "memberi")

conc2 <- conc1 |> 
  mutate(PRONOMINALITY_REC = fct_relevel(PRONOMINALITY_REC,
                                         "pers_pron_1_sg",
                                         "pers_pron_1_pl_excl",
                                         "pers_pron_2_sg",
                                         "pers_pron_3_sg",
                                         "pers_pron_3_pl",
                                         "n",
                                         "np",
                                         "proper_name"),
         PRONOMINALITY_REC1 = fct_relabel(PRONOMINALITY_REC,
                                          ~str_replace(., "^pers_pron.+", "pron"))
  ) |> 
  mutate(PRONOMINALITY_REC2 = if_else(PRONOMINALITY_REC1 == "pron", "pron", "nonpron"),
         PRONOMINALITY_REC2 = factor(PRONOMINALITY_REC2, levels = c("pron", "nonpron")),
         PRONOMINALITY_TH1 = if_else(PRONOMINALITY_TH %in% c("n", "np"), "nonpron", "pron"),
         PRONOMINALITY_TH1 = factor(PRONOMINALITY_TH1, levels = c("nonpron", "pron"))) |> 
  mutate(SYNTAX2 = if_else(SYNTAX == "ditransitive", 0L, 1L)) |> 
  mutate(LOG10_REC_LENGTH_IN_CHAR = log10(REC_LENGTH_IN_CHAR),
         LOG10_TH_LENGTH_IN_CHAR = log10(TH_LENGTH_IN_CHAR))

attach(conc2)

spineplot(SYNTAX ~ LOG10_TH_LENGTH_IN_CHAR)
spineplot(SYNTAX ~ LOG10_REC_LENGTH_IN_CHAR)

assocstats(table(SYNTAX, PRONOMINALITY_REC1))
assoc(table(SYNTAX, PRONOMINALITY_REC1), shade = TRUE)

assocstats(table(SYNTAX, PRONOMINALITY_TH))
assoc(table(SYNTAX, PRONOMINALITY_TH), shade = TRUE)

assocstats(table(SYNTAX, ANIMACY_REC))
assoc(table(SYNTAX, ANIMACY_REC), shade = TRUE)

assocstats(table(SYNTAX, TH_DEF2))
assoc(table(SYNTAX, TH_DEF2), shade = TRUE)

assocstats(table(SYNTAX, REC_DEF2))
assoc(table(SYNTAX, REC_DEF2), shade = TRUE)

# Conditional Inference Tree model =======
set.seed(118)
dtr <- party::ctree(SYNTAX ~ PRONOMINALITY_REC1 + 
                      PRONOMINALITY_TH + 
                      ANIMACY_REC + 
                      ANIMACY_TH + 
                      TH_DEF2 + 
                      REC_DEF2 + 
                      LOG10_REC_LENGTH_IN_CHAR + 
                      LOG10_TH_LENGTH_IN_CHAR,
                    data = conc2, 
                    controls = party::ctree_control(testtype = "MonteCarlo")
)
png("figs/3-conditional-inference-tree.png", 
    units = "in", width = 10, height = 7, res = 300)
plot(dtr)
dev.off()

addmargins(table(predict(dtr), conc2$SYNTAX))
round((table(predict(dtr), conc2$SYNTAX)[1] + table(predict(dtr), conc2$SYNTAX)[4])/
  sum(table(predict(dtr), conc2$SYNTAX)), digits = 2)

# compute C-index for binary response (Levshina 2015: 299, blue box)
dtr_ctree_pred <- unlist(party::treeresponse(dtr))[c(FALSE, TRUE)]
round(Hmisc::somers2(dtr_ctree_pred, as.numeric(conc2$SYNTAX) - 1)[1], digits = 3)

# Random Forest ===== 
set.seed(128)
dtr_rf <- party::cforest(SYNTAX ~ PRONOMINALITY_REC1 + 
                           PRONOMINALITY_TH + 
                           ANIMACY_REC + 
                           ANIMACY_TH + 
                           TH_DEF2 + 
                           REC_DEF2 + 
                           LOG10_REC_LENGTH_IN_CHAR + 
                           LOG10_TH_LENGTH_IN_CHAR,
                         data = subset(conc2), 
                         controls = party::cforest_unbiased(ntree = 2000, 
                                                            mtry = 3))
dtr_varimp <- party::varimp(dtr_rf, conditional = TRUE)
sort(round(dtr_varimp, 3), decreasing = TRUE)

png("figs/4-variable-importance.png", 
    units = "in", width = 8, height = 6, res = 300)
dotchart(sort(dtr_varimp), main = "Conditional Importance of Variables")
dev.off()

addmargins(table(predict(dtr_rf), conc2$SYNTAX))
round((table(predict(dtr_rf), conc2$SYNTAX)[1] + table(predict(dtr_rf), conc2$SYNTAX)[4])/
  sum(table(predict(dtr_rf), conc2$SYNTAX)), digits = 2)

# compute C-index for binary response (Levshina 2015: 299, blue box)
dtr_rf_pred <- unlist(party::treeresponse(dtr_rf))[c(FALSE, TRUE)]
round(Hmisc::somers2(dtr_rf_pred, as.numeric(conc2$SYNTAX) - 1)[1], digits = 3)
