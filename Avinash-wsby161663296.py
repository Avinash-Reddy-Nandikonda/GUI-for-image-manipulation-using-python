'''assignment python
   NAME:Avinash Reddy Nandikonda
   id : WSBY16663296
   COURSE: MBA (BA.AI.ML)'''
   
from tkinter import Tk ,Label , Button ,BOTH ,Frame ,filedialog , messagebox
import cv2 
from PIL import Image , ImageTk

class AVINASH_STUDIO(Tk):
    def __init__(self ):
        Tk.__init__(self)
        self.title('AVINASH EDITOR')
        self.resizable(700,700)
        self.geometry("750x750")
        self.imageLabel = Label(self)
        self.imageLabel.grid(row=0,column=0)
        
        
        self.openImage('')
        
        self.framing = Frame(self)
        self.framing.grid(row=0,column=1)
        
        self.buttonQuit= Button(self.framing, bg='orange',	text='Quit',command=self.quit).pack(fill=BOTH)
        self.buttonOpen	= Button(self.framing, bg='yellow',text='Open image', command=self.openImage).pack(fill=BOTH)
        self.buttonRevert= Button(self.framing, bg='pink',	text='Revert to original',command=self.revertImage).pack(fill=BOTH) 
        self.buttonSave	= Button(self.framing, bg='white',	text='Save image', command=self.saveImage).pack(fill=BOTH) 
        self.buttonGray= Button(self.framing, bg='gray', text='Grayscale',command=self.grayscale).pack(fill=BOTH) 
        self.buttonNeg= Button(self.framing, bg='blue', text='Negative',command=self.negative).pack(fill=BOTH)	
        
    def updateLabel(self, img):  
        tempImg = cv2.cvtColor(img, cv2.COLOR_BGR2RGBA) 
        tempImg = Image.fromarray(tempImg) 
        tempImg = ImageTk.PhotoImage(image=tempImg) 
        self.imageLabel.configure(image=tempImg) 
        self.imageLabel.image = tempImg

    def openImage(self, filename=None):
        if filename is None:	# if the filename was not passed as a parameter
          try: 
              filename = filedialog.askopenfilename(initialdir='~/Pictures',title='Open image') 
          except(OSError, FileNotFoundError): 
              messagebox.showerror('Unable to find or open file <filename>') 
          except Exception as error: 
              messagebox.showerror('An error occurred:error') 
              
        if filename:	# if filename is not an empty string 
         self.image = cv2.imread(filename) 
         self.origImage = self.image.copy() 
         self.updateLabel(self.image)
         
    def revertImage(self): 
            self.image = self.origImage.copy() 
            self.updateLabel(self.image) 
            
    def saveImage(self): 
            try: 
                filename = filedialog.asksaveasfilename(initialdir='~/Pictures',title='Save image') 
            except Exception as error: 
                messagebox.showerror('An error occurred:error') 
                
            if filename:  
                cv2.imwrite(filename, self.image) 
                
    def grayscale(self): 
            b = self.image[:,:,0] 
            g = self.image[:,:,1] 
            r = self.image[:,:,2] 
            gray = 0.114*b + 0.587*g + 0.299*r 
            self.image[:,:,0] = self.image[:,:,1] = self.image[:,:,2] = gray  
            self.updateLabel(self.image) 
            
    def negative(self): 
            self.image[:,:,:] = 255 - self.image[:,:,:] 
            self.updateLabel(self.image) 
            
if __name__ == '__main__': 
    EDITOR= AVINASH_STUDIO() 
    EDITOR.mainloop()
    
    
    
    