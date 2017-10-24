# Movies - Domestic Gross % by Genre


getwd()       # checking our working directory

moviesgross <- read.csv("Section6-Homework-Data.csv")
head(moviesgross)

# Improving column names
colnames(moviesgross) <- c("Day of Week", "Director","Genre", "Movie Title", "Release Date", "Studio", "Adjusted Gross", "Budget", "Gross", "IMDb Rating", "MovieLens Rating", "Overseas", "OverseasPercentage", "Profit", "ProfitPercentage", "Runtime", "US", "USGrossPercentage")
head(moviesgross)

summary(moviesgross)         
str(moviesgross)            # Exploring the data


# Activating ggplot2
install.packages(ggplot2)
library(ggplot2)




# Filtering the data frame

moviesgross <- moviesgross[(moviesgross$Studio == "Fox"|
            moviesgross$Studio == "Sony"|
            moviesgross$Studio == "Paramount Pictures"|
            moviesgross$Studio == "Universal"|
            moviesgross$Studio == "WB"|
            moviesgross$Studio == "Buena Vista Studios") &
           (moviesgross$Genre == "action"|
            moviesgross$Genre == "adventure"|
            moviesgross$Genre == "animation"|
            moviesgross$Genre == "comedy"|
            moviesgross$Genre == "drama"),]

summary(moviesgross)



# Plotting the graph

p <- ggplot(data = moviesgross, aes(x = Genre,
            y = USGrossPercentage, size = Budget))

q <- p + geom_jitter(aes(colour = Studio)) + geom_boxplot(size = 1.2, alpha = 0.5, outlier.colour = NA) +
  xlab("Genre") + ylab("Gross%US") +
  ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(colour = "blue", size = 20),
        axis.title.y = element_text(colour = "blue", size = 20),
        axis.text.x = element_text(size = 15),
        axis.text.y = element_text(size = 15),
        legend.title = element_text(size = 15),
        legend.text = element_text(size = 10),
        plot.title = element_text(size = 25, hjust = 0.5),
        text = element_text(family = "Comic Sans MS"))        # Changes the text of all elements  



# Editing Label

q$labels$size = "Budget $M"
q



  
  
  
  
  
  
  
