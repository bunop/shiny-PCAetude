
# calculate the PCA of the IRIS dataset. First remove categorical values
df <- iris[1:4]

# and now calculate the PCA
pca_res <- prcomp(df, scale. = TRUE)