import os

input="/home/ahmed/Dropbox/DCAR/References/mediationdictionary.pdf"
output="/home/ahmed/tst/pdf.txt"

def convert_pdf_txt(input,output):
    """docstring for convert_pdf_txt"""
    os.system(("ps2ascii %s %s") %( input , output))
    print('Done!')
