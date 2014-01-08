#Enter script code
 import PyQt4
 import sys
 from PySide.QtCore import *
 from PySide.QtGui import *
  
def index(): 
    app = QApplication(sys.argv)
    button = QPushButton(u"".join("wwww"))
    button.clicked.connect(u"".join("wwwwww"))
    button.show()
    app.exec_()
    return dict(message="hello from ak.py")