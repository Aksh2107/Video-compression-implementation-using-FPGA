import numpy as np
import cv2
import math
import time

class compression(object):
	"""docstring for compression"""
	def __init__(self):
		self.image_h= 480
		self.image_w= 640
		self.block_size = 8

		# Quantization Matrix 
		self.quant = np.array([[16,11,10,16,24,40,51,61],[12,12,14,19,26,58,60,55],[14,13,16,24,40,57,69,56 ],[14,17,22,29,51,87,80,62],[18,22,37,56,68,109,103,77],[24,35,55,64,81,104,113,92],[49,64,78,87,103,121,120,101],[72,92,95,98,112,100,103,99]])

	def RLE(self,image):
	    i = 0
	    skip = 0
	    # stream = []    
	    bitstream = []
	    image = image.astype(int)
	    # print image.shape[0]
	    while i < image.shape[0]:
	        if image[i] != 0:            
	            # stream.append((image[i],skip))
	            bitstream.append(image[i])
	            bitstream.append(skip)
	            # bitstream = bitstream + str(image[i])+ " " +str(skip)+ " "
	            skip = 0
	        else:
	            skip = skip + 1
	        i = i + 1

	    return bitstream
	def RLD(self,decode):
	    i = 0
	    skip = 0   
	    image = []
	    
	    while i != len(decode):
	    	# image.append(decode[i])
	        if decode[i+1] != 0:
	        	while skip != (decode[i+1]):
	        		image.append(0)
	        		skip=skip+1
	            # bitstream = bitstream + str(image[i])+ " " +str(skip)+ " "
	        image.append(decode[i])
	        i = i + 2
	        skip=0
	    if (i==len(decode)):
	    	for m in range(0, (307200-len(image))):
	    		image.append(0)
	    # print len(image)
	    return image
	def black_image(self,image):
		# No of blocks needed : Calculation
		height = self.image_h
		width = self.image_w
		h = np.float32(height) 
		w = np.float32(width) 

		self.nbh = math.ceil(h/self.block_size)
		self.nbh = np.int32(self.nbh)

		self.nbw = math.ceil(w/self.block_size)
		self.nbw = np.int32(self.nbw)
		# Pad the image, because sometime image size is not dividable to block size
		# get the size of padded image by multiplying block size by number of blocks in height/width
		# height of padded image
		H =  self.block_size * self.nbh
		# width of padded image
		W =  self.block_size * self.nbw
		# create a numpy zero matrix with size of H,W
		padded_img = np.zeros((H,W))
		# cv2.imshow("inside_image", padded_img[0:height,0:width])
		padded_img[0:height,0:width] = image[0:height,0:width]
		# cv2.imshow("inside_image", padded_img)
		return padded_img
	def zigzag(sefl,input):
	    #initializing the variables
	    #----------------------------------
	    h = 0
	    v = 0
	    vmin = 0
	    hmin = 0
	    vmax = input.shape[0]
	    hmax = input.shape[1]
	    print(vmax ,hmax )
	    i = 0
	    output = np.zeros(( vmax * hmax))
	    #----------------------------------
	    while ((v < vmax) and (h < hmax)):  	
	        if ((h + v) % 2) == 0:                 # going up
	            if (v == vmin):
	            	#print(1)
	                output[i] = input[v, h]        # if we got to the first line
	                if (h == hmax):
	                    v = v + 1
	                else:
	                    h = h + 1                        
	                i = i + 1
	            elif ((h == hmax -1 ) and (v < vmax)):   # if we got to the last column
	            	#print(2)
	            	output[i] = input[v, h] 
	            	v = v + 1
	            	i = i + 1
	            elif ((v > vmin) and (h < hmax -1 )):    # all other cases
	            	#print(3)
	            	output[i] = input[v, h] 
	            	v = v - 1
	            	h = h + 1
	            	i = i + 1
	        else:                                    # going down

	        	if ((v == vmax -1) and (h <= hmax -1)):       # if we got to the last line
	        		#print(4)
	        		output[i] = input[v, h] 
	        		h = h + 1
	        		i = i + 1
	        
	        	elif (h == hmin):                  # if we got to the first column
	        		#print(5)
	        		output[i] = input[v, h] 

	        		if (v == vmax -1):
	        			h = h + 1
	        		else:
	        			v = v + 1
	        		i = i + 1

	        	elif ((v < vmax -1) and (h > hmin)):     # all other cases
	        		#print(6)
	        		output[i] = input[v, h] 
	        		v = v + 1
	        		h = h - 1
	        		i = i + 1
	        if ((v == vmax-1) and (h == hmax-1)):          # bottom right element
	        	#print(7)        	
	        	output[i] = input[v, h] 
	        	break

	    #print ('v:',v,', h:',h,', i:',i)
	    return output

	def inverse_zigzag(self,input, vmax, hmax):
		
		#print input.shape

		# initializing the variables
		#----------------------------------
		h = 0
		v = 0

		vmin = 0
		hmin = 0

		output = np.zeros((vmax, hmax))

		i = 0
	    #----------------------------------

		while ((v < vmax) and (h < hmax)): 
			#print ('v:',v,', h:',h,', i:',i)   	
			if ((h + v) % 2) == 0:                 # going up
	            
				if (v == vmin):
					#print(1)
					
					output[v, h] = input[i]        # if we got to the first line

					if (h == hmax):
						v = v + 1
					else:
						h = h + 1                        
					i = i + 1
				elif ((h == hmax -1 ) and (v < vmax)):   # if we got to the last column
					#print(2)
					output[v, h] = input[i] 
					v = v + 1
					i = i + 1
				elif ((v > vmin) and (h < hmax -1 )):    # all other cases
					#print(3)
					output[v, h] = input[i] 
					v = v - 1
					h = h + 1
					i = i + 1 
			else:                                    # going down

				if ((v == vmax -1) and (h <= hmax -1)):       # if we got to the last line
					#print(4)
					output[v, h] = input[i] 
					h = h + 1
					i = i + 1
	        
				elif (h == hmin):                  # if we got to the first column
					#print(5)
					output[v, h] = input[i] 
					if (v == vmax -1):
						h = h + 1
					else:
						v = v + 1
					i = i + 1
	        		        		
				elif((v < vmax -1) and (h > hmin)):     # all other cases
					output[v, h] = input[i] 
					v = v + 1
					h = h - 1
					i = i + 1
			if ((v == vmax-1) and (h == hmax-1)):          # bottom right element
				#print(7)        	
				output[v, h] = input[i] 
				break
		return output

	def compression_algo(self):
		while (cap.isOpened()):
			ret,frame= cap.read()
			# cv2.imshow("image", frame)
			#You can try with this matrix to understand working of DCT
			#img = np.array([[255,255,227,204,204,203,192,217],[215,189,167,166,160,135,167,244],[169,115,99,99,99,82,127,220],[146,90,86,88,84,63,195,189],[255,255,231,239,240,182,251,232],[255,255,21,245,226,169,229,247],[255,255,222,251,174,209,174,163],[255,255,221,184,205,248,249,220]])

			img = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

		 	cv2.imshow("original Image", frame )
			# start encoding:
			# divide image into block size by block size (here: 8-by-8) blocks
			# To each block apply 2D discrete cosine transform
			# reorder DCT coefficients in zig-zag order
			# reshaped it back to block size by block size (here: 8-by-8)
			padded_img = self.black_image(img)
			# cv2.imshow("padded_img", padded_img)
			# cv2.imshow("original image", img)
			for i in range(self.nbh):			    
			        # Compute start and end row index of the block
			        row_ind_1 = i*self.block_size                
			        row_ind_2 = row_ind_1+self.block_size
		     
			        for j in range(self.nbw):			            
			            # Compute start & end column index of the block
			            col_ind_1 = j*self.block_size                       
			            col_ind_2 = col_ind_1+self.block_size			                        
			            block = padded_img[ row_ind_1 : row_ind_2 , col_ind_1 : col_ind_2 ]		
			            # print block, type(block)	                       
			            # apply 2D discrete cosine transform to the selected block                       
			            DCT = cv2.dct(block)   
			            # cv2.imshow("subimage"+str(i), DCT)         
			            DCT_normalized = np.divide(DCT,self.quant).astype(int)   
			            # cv2.imshow("subimage"+str(i), DCT_normalized)         
			            
			            # reorder DCT coefficients in zig zag order by calling zigzag function
			            # it will give you a one dimentional array
			            # print DCT_normalized
			            reordered = self.zigzag(DCT_normalized)	


			            # reshape the reorderd array back to (block size by block size) (here: 8-by-8)
			            reshaped= np.reshape(reordered, (self.block_size, self.block_size)) 
			            # print reshaped, type(reshaped)   
			            # cv2.imshow("img"+ str(i), reordered )
			            # copy reshaped matrix into padded_img on current block corresponding indices
			            padded_img[row_ind_1 : row_ind_2 , col_ind_1 : col_ind_2] = reshaped 

			            # padded_prev_image[row_ind_1 : row_ind_2 , col_ind_1 : col_ind_2] = padded_img[row_ind_1 : row_ind_2 , col_ind_1 : col_ind_2]

			# print padded_img, np.uint8(padded_img)
			# p_frame = padded_img - padded_prev_image
			# padded_prev_image = padded_img
			
			# cv2.imwrite('uncompressed.bmp', np.uint8(padded_img))
			cv2.imshow('Zig-zag Combined image', np.uint8(padded_img))

			


			# out.write(np.uint8(padded_img))
			arranged = padded_img.flatten()
			# Now RLE encoded data is written to a text file (You can check no of bytes in text file is very less than no of bytes in the image
			# THIS IS COMPRESSION WE WANTED, NOTE THAT ITS JUST COMPRESSION DUE TO RLE, YOU CAN COMPRESS IT FURTHER USING HUFFMAN CODES OR MAY BE 
			# REDUCING MORE FREQUENCY COEFFICIENTS TO ZERO)
			# print "=================================================================================="
			# print len(arranged)
			bitstream = self.RLE(arranged)
			# print len(bitstream)

			value = self.RLD(bitstream)
			# print " value =================================================================================="
			# print (value[150000:150010])
			# print len(value)
			value = np.reshape(value,(self.image_h,self.image_w))
			# print type(value)
			# print value
			self.decompress_algo(value)


			# Two terms are assigned for size as well, semicolon denotes end of image to reciever
			# bitstream = str(padded_img.shape[0]) + " " + str(padded_img.shape[1]) + " " + bitstream + ";"

			# Written to image.txt
			# file1 = open("image.txt","w")
			# file1.write(bitstream)
			# file1.close()
			if cv2.waitKey(1) & 0xFF == ord('q'):
				break
	def decompress_algo(self,compressed_img):
		padded_img =np.zeros((self.image_h, self.image_w))
		# cv2.imshow("decompression padded image", compressed_img)
		# reshaped = np.reshape(compressed_img,(self.image_h, self.image_w))
		# cv2.imshow("reshaped", reshaped)
		for i in range(self.nbh):			    
		        # Compute start and end row index of the block
		        row_ind_1 = i*self.block_size                
		        row_ind_2 = row_ind_1+self.block_size
	     
		        for j in range(self.nbw):			            
		            # Compute start & end column index of the block
		            col_ind_1 = j*self.block_size                       
		            col_ind_2 = col_ind_1+self.block_size			                        
		            block = (compressed_img[ row_ind_1 : row_ind_2 , col_ind_1 : col_ind_2 ])
		            # apply 2D discrete cosine transform to the selected block   
		            
		            block = self.inverse_zigzag(np.int8(block.flatten()), self.block_size, self.block_size)
		            # print block
		            de_quantize = np.multiply(block,self.quant)            
		            inverse_DCT = cv2.idct(de_quantize)            		            
		            # reshape the reorderd array back to (block size by block size) (here: 8-by-8)
		            reshaped= np.reshape(inverse_DCT, (self.block_size, self.block_size)) 
		            # cv2.imshow("img"+ str(i), reordered )
		            # copy reshaped matrix into padded_img on current block corresponding indices
		            padded_img[row_ind_1 : row_ind_2 , col_ind_1 : col_ind_2] = reshaped 

		cv2.imshow("uncompressed", np.uint8(padded_img))


if __name__ == '__main__':
	comp = compression()
	cap = cv2.VideoCapture(0)
	comp.compression_algo()
	cap.release()
	cv2.destroyAllWindows()