#project: student performance and outlier analysis
#Author: Ali İhsan Bayraktar


# Data Importing(Student Performance Data)
url <- "https://raw.githubusercontent.com/guipsamora/pandas_exercises/master/04_Apply/Students_Alcohol_Consumption/student-mat.csv"

# Read data
nd <- read.csv(url)

#Looking the data
head(nd)
str(nd)
View(nd)

#data cleaning, selecting relevant columns

pickedcolumns <- c("school", "sex", "age", "studytime", "absences", "G3")
at <- nd[ ,pickedcolumns]
#control the data
head(at)
str(at)

#statistical Analysis
mean_g <- mean(at$G3)
sd_g <- sd(at$G3)

#top limit is exceptional success (top 2.5%)
#Bottom limit is risk group (bottom 2.5%)

top_limit <- mean_g + (2 * sd_g )
bottom_limit <- mean_g - (2 * sd_g)

#filtering the data
heroes <- at[at$G3 > top_limit, ]
losers <- at[at$G3 < bottom_limit, ]
nrow(heroes)
nrow(losers)

#absence control
g_absence <- mean(at$absences)
r_absence <- mean(losers$absences)

print(g_absence)
print(r_absence)

#Labelling
at$durum <- "Normal"
at$durum[at$G3 > top_limit ] <- "Hero"
at$durum[at$G3 < bottom_limit ] <- "Zero"

#Reporting 
write.csv(at, "final_school_report", row.names = FALSE)


