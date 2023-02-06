Das Herunterladen von Bildern ist in R ziemlich einfach.
'''r
y = "http://upload.wikimedia.org/wikipedia/commons/5/5d/AaronEckhart10TIFF.jpg"
download.file(y,'y.jpg', mode = 'wb')
'''
