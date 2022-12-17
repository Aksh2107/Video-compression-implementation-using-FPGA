
import numpy as np
import cv2

img = cv2.imread("Lena.jpg")
img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

print(np.shape(img))
W = 640
H = 480

img = img.astype(int);

file = open("Lena.txt","w") 
block_size =8 
print img
for i in range(H/block_size):
	row_ind_1 = i*block_size                
	row_ind_2 = row_ind_1+ block_size
	print row_ind_1
	for j in range(W/block_size):
	    col_ind_1 = j*block_size                       
	    col_ind_2 = col_ind_1+block_size
	    image_8_8 =img[ row_ind_1 : row_ind_2 , col_ind_1 : col_ind_2 ]

	    h_8 = np.shape(image_8_8)[1]
	    w_8 = np.shape(image_8_8)[0]
	    for p in range(h_8):
		    for q in range(w_8):
			    file.write(str(image_8_8[p][q]) + " ")
			    file.write("\n")

print (h_8,w_8)

#file.write(";") 

file.close() 
