library(tidyverse)
qiime2_manifest <- read_table("results/qc/seqkit1/mouse_gut_seqkit_stats.txt", show_col_types = F) %>% 
  mutate(sample_id = str_replace_all(file, ".*/", ""), .before=file) %>% 
  mutate(sample_id = str_replace_all(sample_id, "_.*", "")) %>%
  filter(str_detect(file, "_R1" )) %>% 
  mutate(file2 =file, .after = file) %>% 
  mutate(file2 = str_replace_all(file, "_R1_001", "_R2_001")) %>%
  distinct() %>% 
  mutate(file = str_replace_all(file, "resources", "$PWD/resources")) %>%
  mutate(file2 = str_replace_all(file2, "resources", "$PWD/resources")) %>%
  select("sample-id" = sample_id, "forward-absolute-filepath" = file, "reverse-absolute-filepath" = file2) 

qiime2_manifest %>% 
  write_tsv("results/qiime2_manifest_file.tsv")

metadata <- read_tsv("resources/metadata/mouse_gut.tsv", show_col_types = FALSE) %>%
  rename_all(tolower)

sample_metadata <- read_tsv("results/qiime2_manifest_file.tsv", show_col_types = F) %>% 
  select(sample_id="sample-id") %>% 
  inner_join(., metadata, by = 'sample_id') %>% 
  rename("sample-id" = sample_id) %>%
  select("sample-id", sex, time)

new_row <- c("#q2:types", "categorical", "categorical")

qiime2_metadata_file <- rbind(sample_metadata[1-1,], new_row, sample_metadata ) %>% 
  write_tsv("results/qiime2_metadata_file.tsv")

# library(tidyverse)
# read_table("results/qc/seqkit1/seqkit_stats.txt", show_col_types = F) %>% 
#   mutate(sample_id = str_replace_all(file, ".*/", ""), .before=file) %>% 
#   mutate(sample_id = str_replace_all(sample_id, "_\\d?.fastq.gz", "")) %>%
#   filter(str_detect(file, "_1" )) %>% 
#   mutate(file2 =file, .after = file) %>% 
#   mutate(file2 = str_replace_all(file, "_1.fastq.gz", "_2.fastq.gz")) %>%
#   distinct() %>% 
#   group_by(sample_id) %>%
#   # filter(num_seqs <65000) %>% 
#   arrange(num_seqs) %>%
#   ungroup() %>% 
#   mutate(file = str_replace_all(file, ".*/SRR", "$PWD/SRR")) %>%
#   mutate(file2 = str_replace_all(file2, ".*/SRR", "$PWD/SRR")) %>%
#   select("sample-id" = sample_id, "forward-absolute-filepath" = file, "reverse-absolute-filepath" = file2) %>% 
#   write_tsv("results/qiime2_manifest_file.tsv")

# read_tsv("results/qiime2_manifest_file.tsv", show_col_types = F) %>% 
#   select("sample-id") %>% 
#   inner_join(., read_csv("resources/metadata/metadata.csv", show_col_types = FALSE), by = c("sample-id"="run")) %>% 
#   select(1:4) %>% 
#   head() %>% 
#   as.data.frame() %>% 
#   write_tsv("results/qiime2_metadata_file.tsv")


# library(tidyverse)
# read_table("results/seqkit1/seqkit_stats.txt", show_col_types = F) %>% 
#   mutate(sample_id = str_replace_all(file, ".*/", ""), .before=file) %>% 
#   mutate(sample_id = str_replace_all(sample_id, "_.*", "")) %>%
#   filter(str_detect(file, "_R1" )) %>% 
#   mutate(file2 =file, .after = file) %>% 
#   mutate(file2 = str_replace_all(file, "_R1_001", "_R2_001")) %>%
#   distinct() %>% 
#   mutate(file = str_replace_all(file, "resources", "$PWD/resources")) %>%
#   mutate(file2 = str_replace_all(file2, "resources", "$PWD/resources")) %>%
#   select("sample-id" = sample_id, "forward-absolute-filepath" = file, "reverse-absolute-filepath" = file2) %>% 
#   write_tsv("results/qiime2_manifest_file.tsv")

