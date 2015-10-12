import cv2

if __name__ == '__main__':
	import sys
	videoPath = 'TheRedBalloon.mp4'
	cascPath = 'haarcascade_frontalface_default.xml'

	faceCascade = cv2.CascadeClassifier(cascPath)
	cap = cv2.VideoCapture(videoPath)

	while (cap.isOpened()):
		ret, frame = cap.read()

		gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

		faces = faceCascade.detectMultiScale(gray, scaleFactor=1.1, 
			minNeighbors=5, minSize=(30, 30), flags=cv2.cv.CV_HAAR_SCALE_IMAGE)
		# Draw rectangle around the face
		for (x, y, w, h) in faces:
			cv2.rectangle(frame, (x, y), (x+w, y+h), (0, 255, 0), 2)

		cv2.imshow('video', frame)

		if cv2.waitKey(1) & 0xFF == ord('q'):
			break

	cap.release()
	cv2.destroyAllWindows()