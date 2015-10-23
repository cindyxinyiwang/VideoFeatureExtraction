import cv2
import numpy as np

if __name__ == '__main__':
	import sys
	videoPath = 'TheRedBalloon.mp4'

	cap = cv2.VideoCapture(videoPath)

	while (cap.isOpened()):
		ret, frame = cap.read()

		hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

		lower_red_hue_low = np.array([0, 100, 100])
		lower_red_hue_high = np.array([10, 255, 255])
		upper_red_hue_low = np.array([160, 100, 100])
		upper_red_hue_high = np.array([179, 255, 255])

		red_low_mask = cv2.inRange(hsv, lower_red_hue_low, lower_red_hue_high)
		red_high_mask = cv2.inRange(hsv, upper_red_hue_low, upper_red_hue_high)

		mask = cv2.addWeighted(red_low_mask, 1, red_high_mask, 1, 0)
		res = cv2.bitwise_and(frame, frame, mask = mask )
	
		# try to detect circle, not working so well
		"""	
		circles = cv2.HoughCircles(mask, cv2.cv.CV_HOUGH_GRADIENT, 1.2, 100)
		if circles is not None:
			circles = np.round(circles[0, :]).astype("int")
			for (x, y, r) in circles:
				cv2.circle(frame, (x, y), r, (0, 255, 0), 4)
		"""
		# find contours
		contours, hier = cv2.findContours(mask, cv2.RETR_LIST, cv2.CHAIN_APPROX_SIMPLE)
		for cnt in contours:
			if 200 < cv2.contourArea(cnt) < 5000:
				cv2.drawContours(mask,[cnt], 0, (0, 255, 0), 2)

		cv2.imshow('video', frame)
		cv2.imshow('mask', mask)
		cv2.imshow('res', res)

		if cv2.waitKey(1) & 0xFF == ord('q'):
			break

	cap.release()
	cv2.destroyAllWindows()