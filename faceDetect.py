import cv2

if __name__ == '__main__':
	import sys
	imagePath = 'test1.jpg'
	cascPath = 'haarcascade_frontalface_default.xml'

	# create the haar cascade
	faceCascade = cv2.CascadeClassifier(cascPath)
	# Read the image
	image = cv2.imread(imagePath)
	gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
	# Detect faces in image
	faces = faceCascade.detectMultiScale(
		gray,
		scaleFactor=1.3,
		minNeighbors=5
	)

	print "Found {0} faces!".format(len(faces))
	# Draw rectangle around the face
	for (x, y, w, h) in faces:
		cv2.rectangle(image, (x, y), (x+w, y+h), (0, 255, 0), 2)
	cv2.imshow("Faces found", image)
	cv2.waitKey(0)