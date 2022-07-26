library(tidyverse)
library(vcd)

# read in the main dataset =====
conc1 <- read_tsv("data/df_beri.txt")

# tabulate the frequency of construction types per verb =====
## memberi =====
cxn_beri <- conc1 %>% 
  filter(NODE == "memberi") %>% 
  count(SYNTAX) %>% 
  mutate(perc = round(n/sum(n) * 100, 1),
         verb = "memberi",
         props = n/sum(n))
cxn_beri_vector <- cxn_beri$n
names(cxn_beri_vector) <- cxn_beri$SYNTAX
cxn_beri_vector_perc <- round(prop.table(cxn_beri_vector) * 100, 1)

## memberi-kan =====
cxn_berikan <- conc1 %>% 
  filter(NODE == "memberikan") %>% 
  count(SYNTAX) %>% 
  mutate(perc = round(n/sum(n) * 100, 1),
         verb = "memberikan",
         props = n/sum(n))
cxn_berikan_vector <- cxn_berikan$n
names(cxn_berikan_vector) <- cxn_berikan$SYNTAX
cxn_berikan_vector_perc <- round(prop.table(cxn_berikan_vector) * 100, 1)

## combine all frequency count for the two verbs ======
cxn_all_verbs <- bind_rows(cxn_beri, cxn_berikan) %>% 
  rename(cxn = SYNTAX) %>% 
  mutate(cxn = factor(cxn, levels = c("datif", "objek ganda")),
         verb = factor(verb, levels = c("memberi", "memberikan"))) %>% 
  # add the total count for each verb for running binomial test and confidence interval
  group_by(verb) %>% 
  mutate(sum_verb = sum(n)) %>% 
  ungroup()

## count the total frequencies of each construction =====
cxn_freq_all <- cxn_all_verbs %>% 
  group_by(cxn) %>% 
  summarise(n = sum(n), .groups = "drop") %>% 
  mutate(perc = n/sum(n) * 100, props = n/sum(n))

### binomial test for all constructions (1st analytical perspective) =====
binom.test(cxn_freq_all$n)
binom.test(cxn_freq_all$n)$p.value < 0.0001

## run the binomial test =====
cxn_all_verbs <- cxn_all_verbs %>% 
  mutate(binom_res = pmap(list(x = n, n = sum_verb), binom.test),
         # extract the confidence interval values
         conf_low = map_dbl(binom_res, list("conf.int", 1)),
         conf_high = map_dbl(binom_res, list("conf.int", 2)),
         # extract the estimate
         estimate = map_dbl(binom_res, "estimate"),
         pbin = map_dbl(binom_res, "p.value"),
         signifs = "ns",
         signifs = if_else(pbin < 0.05, "*", signifs),
         signifs = if_else(pbin < 0.01, "**", signifs),
         signifs = if_else(pbin < 0.001, "***", signifs)
         )

### check the binomial test results for each construction in each verb (2nd analytical perspective) =======
cxn_all_verbs %>% filter(verb == "memberi") %>% select(pbin) %>% pull() %>% unique()
cxn_all_verbs %>% filter(verb == "memberikan") %>% select(pbin) %>% pull() %>% unique()

### retrieve the 95% confidence interval (2nd analytical perspective) =======
#### memberi + datif
cxn_all_verbs %>% 
  filter(verb == "memberi", cxn == "datif") %>% 
  select(conf_low, conf_high) %>% 
  mutate(across(where(is.numeric), ~.x * 100))
#### memberi + objek ganda
cxn_all_verbs %>% 
  filter(verb == "memberi", cxn == "objek ganda") %>% 
  select(conf_low, conf_high) %>% 
  mutate(across(where(is.numeric), ~.x * 100))
#### memberikan + datif
cxn_all_verbs %>% 
  filter(verb == "memberikan", cxn == "datif") %>% 
  select(conf_low, conf_high) %>% 
  mutate(across(where(is.numeric), ~.x * 100))
#### memberikan + objek ganda
cxn_all_verbs %>% 
  filter(verb == "memberikan", cxn == "objek ganda") %>% 
  select(conf_low, conf_high) %>% 
  mutate(across(where(is.numeric), ~.x * 100))


## visualisation =====
cxn_all_verbs %>% 
  ggplot(aes(x = verb, y = props, fill = cxn)) + 
  geom_col(position = position_dodge(.9), colour = "gray50") +
  scale_fill_brewer(type = "qual", palette = 4, direction = -1) +
  geom_text(aes(label = paste("n=", n, sep = "")), 
            position = position_dodge(.9),
            vjust = c(9, 9, 9, 5),
            size = 3.5) +
  theme_bw() +
  labs(y = "frekuensi relatif\n(proporsi)",
       fill = "konstruksi",
       x = "verba") +
  geom_errorbar(aes(ymin = conf_low, ymax = conf_high), 
                width = .2, position = position_dodge(.9))
### save plot =======
ggsave('figs/1-barplot.png', 
       width = 6.5, height = 4.5, units = 'in', dpi = 300)


# significance test ======
## create the matrix table first
mtx_v_cxn <- cxn_all_verbs %>% 
  select(cxn, n, verb) %>% 
  pivot_wider(names_from = cxn, values_from = n) %>% 
  column_to_rownames(var = "verb") %>% 
  as.matrix()
(mtx_v_cxn1 <- t(mtx_v_cxn[, c(2, 1)])) # reverse the order of the column

## create the proportion table
round(prop.table(mtx_v_cxn1, margin = 2) * 100)

## run the fisher exact test for the complete table
fisher.test(mtx_v_cxn1)
fisher.test(mtx_v_cxn1)$p.value < 0.0001

## odds ratio
round(fisher.test(mtx_v_cxn1)$estimate, 1)
### results: higher likelihood of double-object cxn for "memberi" as compared to "memberikan" even though as per "memberi" itself, no significant difference is found for double-object vs. dative construction.

## run the effect size with vcd
assocstats(mtx_v_cxn1)

## create association plot
png("figs/2-assocplot.png", units = "in", width = 6, height = 5, res = 300)
assoc(t(mtx_v_cxn1), shade = TRUE)
dev.off()

## penyimpangan kemunculan memberikan pada konstruksi objek ganda vs. prediksi null frequency
btest <- binom.test(c(mtx_v_cxn1[rownames(mtx_v_cxn1) == "objek ganda", "memberikan"],
             0), alternative = "greater")
btest$p.value
btest$p.value < 0.0001
