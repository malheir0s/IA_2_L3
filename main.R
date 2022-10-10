
#Limpar ambiente do R
remove(list=ls())

#Pacote e instalacao

# if (!requireNamespace("BiocManager", quietly = TRUE))
#     install.packages("BiocManager")
#     BiocManager::install("EBImage")

library("EBImage")


##
setwd("/work/original_images")

for (f in list.files()){
 im = readImage(f)
 graus_rotacionar <- runif(1, 0.0, 360.0)
 im_step1 <- rotate(im, graus_rotacionar)

 alteracao_brilho <- runif(1, -0.5, 0.5)
 im_step2<-im_step1
 im_step2@.Data=im_step1@.Data+alteracao_brilho
 
 alteracao_contraste <- runif(1, 0.2, 2.0)
 im_step3=im_step2
 im_step3@.Data=im_step2@.Data*alteracao_contraste

 setwd("/work/augmented")
 writeImage(im_step3,file=f)
 setwd("/work/original_images")
}