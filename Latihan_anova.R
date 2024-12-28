#Nama: Jaya Yuonky Ornando /NIM: 2415091042

install.packages("dplyr")
install.packages("car")
install.packages("ggplot2")
install.packages("nortest")

# Impor data
data <- read.table(text="user_id	app_type	score
U001	App_C	76.51
U002	App_A	74.84
U003	App_C	61.7
U004	App_C	74.75
U005	App_A	88.43
U006	App_A	67.65
U007	App_C	65.4
U008	App_B	86.05
U009	App_C	81.34
U010	App_C	105.61
U011	App_C	61.81
U012	App_C	82.2
U013	App_A	78.16
U014	App_C	75.59
U015	App_B	84.11
U016	App_A	74.7
U017	App_B	55.64
U018	App_B	66.53
U019	App_B	88.64
U020	App_B	86.72
U021	App_A	71.27
U022	App_A	80.04
U023	App_B	102.84
U024	App_B	74.69
U025	App_A	74.88
U026	App_A	76.91
U027	App_A	81.07
U028	App_C	71.51
U029	App_C	81.06
U030	App_C	55.56", header=TRUE, sep="\t")

# Tambahkan sisa data
data <- rbind(data, read.table(text="U031	App_B	78.36
U032	App_C	75.51
U033	App_B	72.83
U034	App_B	70.25
U035	App_C	68.91
U036	App_B	66.86
U037	App_C	51.82
U038	App_C	72.32
U039	App_A	85.96
U040	App_C	71.65
U041	App_A	81.35
U042	App_C	64.2
U043	App_C	61.94
U044	App_A	67.49
U045	App_A	64.75
U046	App_C	63.17
U047	App_B	79.5
U048	App_A	92.79
U049	App_B	68.33
U050	App_B	58.08
U051	App_B	81.57
U052	App_A	60.64
U053	App_B	63.17
U054	App_A	79.95
U055	App_B	73.35
U056	App_C	68.13
U057	App_C	75.68
U058	App_A	70.91
U059	App_C	93.9
U060	App_C	68.24
U061	App_B	65.87
U062	App_A	70.45
U063	App_B	70.87
U064	App_B	80.96
U065	App_B	55.08
U066	App_B	79.26
U067	App_B	69.59
U068	App_B	82.77
U069	App_B	74.52
U070	App_A	80.19
U071	App_C	71.09
U072	App_B	79.38
U073	App_B	91.64
U074	App_B	67.61
U075	App_B	73.93
U076	App_B	70.14
U077	App_B	90.93
U078	App_C	70.66
U079	App_C	67.67
U080	App_B	69.22
U081	App_C	73.64
U082	App_A	67.06
U083	App_B	71.32
U084	App_A	76.57
U085	App_A	73.85
U086	App_B	83.32
U087	App_C	71.81
U088	App_A	72.95
U089	App_B	77.71
U090	App_A	97.45
U091	App_A	67.12
U092	App_A	94.24
U093	App_A	63.16
U094	App_C	77.29
U095	App_A	71.61
U096	App_A	66.85
U097	App_A	81.99
U098	App_C	81
U099	App_A	70.19
U100	App_A	54.06
U101	App_C	70.8
U102	App_C	76.39
U103	App_C	75.02
U104	App_A	82.56
U105	App_C	94.34
U106	App_C	79.14
U107	App_A	80.68
U108	App_C	76.48
U109	App_A	86.72
U110	App_B	80.31
U111	App_C	82.49
U112	App_B	93.09
U113	App_A	77.27
U114	App_C	72.29
U115	App_A	79.46
U116	App_B	86.36
U117	App_A	80.01
U118	App_C	85.61
U119	App_C	68.31
U120	App_B	66.32
U121	App_A	69.55
U122	App_C	62.33
U123	App_B	76.1
U124	App_C	70.7
U125	App_C	87.3
U126	App_A	62.09
U127	App_C	90.55
U128	App_A	65.19
U129	App_C	62.62
U130	App_B	66.75
U131	App_C	94.51
U132	App_A	74.6
U133	App_A	80.29
U134	App_B	73.16
U135	App_C	74.1
U136	App_C	69.94
U137	App_B	75.51
U138	App_C	79.95
U139	App_C	91.78
U140	App_A	56.26
U141	App_C	91.11
U142	App_C	80.28
U143	App_B	71.32
U144	App_B	69.52
U145	App_A	85.44
U146	App_C	77.29
U147	App_C	59.66
U148	App_C	78.63
U149	App_A	86.44
U150	App_A	83.58
U151	App_B	68.73
U152	App_A	61.58
U153	App_C	71.74
U154	App_C	107.54
U155	App_A	59.55
U156	App_C	66.57
U157	App_C	78.92
U158	App_A	73.75
U159	App_A	73
U160	App_C	95.25
U161	App_C	66.47
U162	App_C	74.86
U163	App_B	77.02
U164	App_B	66.95
U165	App_B	60.59
U166	App_A	77.69
U167	App_B	93.14
U168	App_A	79.05
U169	App_A	75.9
U170	App_B	75.83
U171	App_B	72.42
U172	App_B	86.83
U173	App_C	69.95
U174	App_B	61.43
U175	App_C	59.18
U176	App_A	75.79
U177	App_C	85.61
U178	App_B	77.37
U179	App_A	71.83
U180	App_A	79.58
U181	App_A	76.86
U182	App_C	83.26
U183	App_B	88.27
U184	App_A	65.46
U185	App_A	51.6
U186	App_A	71.48
U187	App_C	64.81
U188	App_C	83.32
U189	App_B	67.76
U190	App_C	56.24
U191	App_A	69.26
U192	App_B	60.08
U193	App_A	90.9
U194	App_A	79.72
U195	App_C	81.48
U196	App_B	80.36
U197	App_C	83.4
U198	App_C	86.33
U199	App_B	69.6
U200	App_A	60.8
U201	App_A	66.53
U202	App_B	74.55
U203	App_A	49.36
U204	App_B	86.43
U205	App_B	56.03
U206	App_C	80.99
U207	App_B	73.32
U208	App_C	77.85
U209	App_A	70.28
U210	App_A	77.17
U211	App_A	70.28
U212	App_A	69.44
U213	App_C	66.03
U214	App_A	90.26
U215	App_B	78.67
U216	App_B	77.09
U217	App_B	66.24
U218	App_C	72.65
U219	App_A	65.13
U220	App_A	70.09
U221	App_A	62.91
U222	App_C	90.89
U223	App_B	67.43
U224	App_B	66.25
U225	App_A	61.74
U226	App_B	67.29
U227	App_B	70.05
U228	App_C	74.51
U229	App_C	68.55
U230	App_C	58.99
U231	App_C	59.85
U232	App_A	81.8
U233	App_C	73.77
U234	App_B	81.49
U235	App_A	82.8
U236	App_B	76.51
U237	App_B	62.68
U238	App_B	76.9
U239	App_C	89
U240	App_C	70.53
U241	App_A	78.41
U242	App_A	74.86
U243	App_C	88.72
U244	App_B	68.22
U245	App_A	86.54
U246	App_C	71.25
U247	App_C	68.06
U248	App_C	76.1
U249	App_B	78.42
U250	App_C	94.12
U251	App_C	78.2
U252	App_C	76.93
U253	App_C	90.96
U254	App_A	81.01
U255	App_A	68.56
U256	App_C	88.56
U257	App_B	67.6
U258	App_A	68.51
U259	App_C	66.51
U260	App_A	65.64
U261	App_A	78.33
U262	App_B	72.42
U263	App_C	40.22
U264	App_C	72.32
U265	App_B	69.82
U266	App_B	83.93
U267	App_C	69.37
U268	App_C	100.39
U269	App_B	88.97
U270	App_A	71.1
U271	App_A	86.5
U272	App_B	80.25
U273	App_A	77.33
U274	App_B	83.03
U275	App_A	75.54
U276	App_A	77.4
U277	App_C	83.23
U278	App_C	95.52
U279	App_A	77.51
U280	App_A	70.46
U281	App_C	54.71
U282	App_C	94.61
U283	App_C	72.37
U284	App_B	80.35
U285	App_A	94.06
U286	App_C	77.28
U287	App_A	73.05
U288	App_B	89.2
U289	App_B	79.61
U290	App_C	80.86
U291	App_B	59.77
U292	App_A	87.06
U293	App_C	78.76
U294	App_A	61.28
U295	App_A	79.85
U296	App_B	54.37
U297	App_B	98.42
U298	App_B	63.98
U299	App_B	91.12
U300	App_B	66.87", header=TRUE, sep="\t"))

# Statistik Deskriptif
summary_stats <- aggregate(score ~ app_type, data, 
                           FUN = function(x) c(mean = mean(x), 
                                               sd = sd(x), 
                                               min = min(x), 
                                               max = max(x), 
                                               n = length(x)))
print("Statistik Deskriptif:")



print(summary_stats)

# Uji Normalitas (Shapiro-Wilk)
library(dplyr)
normality_test <- data %>% 
  group_by(app_type) %>% 
  summarise(p_value = shapiro.test(score)$p.value)
print("\nUji Normalitas (Shapiro-Wilk):")
print(normality_test)

# Uji Homogenitas Varians (Levene's Test)
library(car)
levene_test <- leveneTest(score ~ app_type, data = data)
print("\nUji Homogenitas Varians (Levene's Test):")
print(levene_test)

# One-Way ANOVA
anova_model <- aov(score ~ app_type, data = data)
anova_summary <- summary(anova_model)
print("\nHasil ANOVA:")
print(anova_summary)

# Uji Post-Hoc Tukey HSD
tukey_test <- TukeyHSD(anova_model)
print("\nUji Post-Hoc Tukey HSD:")
print(tukey_test)

# Visualisasi Boxplot
library(ggplot2)
boxplot_skor <- ggplot(data, aes(x = app_type, y = score, fill = app_type)) +
  geom_boxplot() +
  labs(title = "Distribusi Skor Aplikasi Pembelajaran",
       x = "Aplikasi", 
       y = "Skor") +
  theme_minimal()
print(boxplot_skor)


