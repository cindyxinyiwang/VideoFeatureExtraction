import cv2
import numpy as np

if __name__ == '__main__':
	import sys
	imagePath = 'balloon.png'

	image = cv2.imread(imagePath)
	hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)

	lower_red_hue_low = np.array([0, 100, 100])
	lower_red_hue_high = np.array([10, 255, 255])
	upper_red_hue_low = np.array([160, 100, 100])
	upper_red_hue_high = np.array([179, 255, 255])

	red_low_mask = cv2.inRange(hsv, lower_red_hue_low, lower_red_hue_high)
	red_high_mask = cv2.inRange(hsv, upper_red_hue_low, upper_red_hue_high)

	mask = cv2.addWeighted(red_low_mask, 1, red_high_mask, 1, 0)
	res = cv2.bitwise_and(image, image, mask = mask )
	

	# find contours
	kernel = np.ones((5, 5), np.uint8)
	#preprocess = cv2.morphologyEx(mask, cv2.MORPH_OPEN, kernel)
	preprocess= cv2.morphologyEx(mask, cv2.MORPH_CLOSE, kernel)

	contours, hier = cv2.findContours(preprocess.copy(), cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
	for cnt in contours:
		#cv2.drawContours(image,[cnt], 0, (0, 255, 0), 5)
		if 2000 < cv2.contourArea(cnt):
			cv2.drawContours(image,[cnt], 0, (0, 255, 0), 5)
			M = cv2.moments(cnt)
			#print M
			cx = int(M['m10']/M['m00'])
			cy = int(M['m01']/M['m00'])
			print cx, " " ,cy


	cv2.imshow('preprocess', preprocess)
	cv2.imshow('video', image)
	cv2.imshow('mask', mask)
	cv2.imshow('res', res)
	cv2.waitKey(0)
