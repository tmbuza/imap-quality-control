library(tidyverse, suppressPackageStartupMessages())
library(ggtext)

stats1 <- read_table("results/qc/seqkit1/seqkit_stats.txt", show_col_types = F) %>% 
  mutate(file = str_replace_all(file, ".*/", "")) %>% 
  select(file, original = num_seqs)

stats2 <- read_table("results/qc/seqkit2/seqkit_stats.txt", show_col_types = F) %>% 
  mutate(file = str_replace_all(file, ".*/", "")) %>% 
  select(file, trimmed = num_seqs)

stats3 <- read_table("results/qc/seqkit3/seqkit_stats.txt", show_col_types = F) %>% 
  mutate(file = str_replace_all(file, ".*/", "")) %>% 
  select(file, decontam = num_seqs)

read_stats <- inner_join(stats1, stats2, by = "file") %>% 
  inner_join(., stats3, by = "file") %>% 
  mutate(strand = ifelse(str_detect(file, "_1"), "foward", "reverse"), .before=original) %>%
  pivot_longer(cols = -c(file, strand), names_to = "variable", values_to = "num_seqs") %>% 
  mutate(variable = factor(variable),
         variable = fct_reorder(variable, num_seqs, .desc=TRUE)) %>% 
  ggplot(aes(x = strand, y = num_seqs/1000, fill = variable)) +
  geom_col(position = "dodge") +
  labs(x = "Read Strand", y = "Number of Reads (thousand)", fill = "Preprocess") +
  theme_classic() +
  theme(axis.text.x = element_markdown(),
        legend.text = element_text(face = NULL),
        legend.key.size = unit(12, "pt")) + 
  scale_y_continuous(expand = c(0, 0))

ggsave(file="images/qc_hist.png", width=10, height=10)
ggsave(file="images/qc_hist.svg", width=10, height=10)






