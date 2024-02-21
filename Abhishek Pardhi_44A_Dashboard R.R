---
title: "Untitled"
output: 
  flexdashboard::flex_dashboard:
    orientation: columns
    vertical_layout: fill
---

```{r setup, include=FALSE}
# Importing libraries
library(flexdashboard)
library(tidyverse)
library(highcharter)
library(gt)
library(htmltools)
library(viridis)
```

```{r}
# Importing data
df <- read_csv('goal.csv', show_col_types = FALSE)

# Removing duplicates
df <- df %>%
  distinct(Name, .keep_all = TRUE) %>%
``` 
  
Top Scorers
==================================================
  
column {.tabset .tabset-fade data-width=650}  
  
  
### Top Scorers

```{r}
# Colors
custom_colors <- viridis::mako(n = 15)



# Top Scorers
df %>%
  group_by(Name) %>%
  summarise(Goals = sum(Goals)) %>%
  arrange(desc(Goals)) %>%
  head(15) %>%
  hchart('column', hcaes(x = Name, y = Goals,color = custom_colors)) %>%
  hc_add_theme(hc_theme_google()) %>%
  hc_tooltip(pointFormat = '<b>Number of Goals: </b> {point.y} <br>') %>%
  hc_title(text = 'Top Scorer among Current Players in EPL',
           style = list(fontsize = '25px', fontWeight = 'bold')) %>%
  hc_subtitle(text = 'By Number of goals',
              style = list(fontsize = '16px')) %>%
  hc_credits(enabled = TRUE, text = '@miguelfzzz')
  
```
-----------------------------------------------------------------------

### Chart A

```{r}

```

Column {data-width=350}
-----------------------------------------------------------------------

### Chart B

```{r}

```

### Chart C

```{r}

```

