import pandas as pd 
import numpy as np 
import distcorr
import warnings
import pyximport
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")

df = pd.DataFrame(np.random.randint(0,100,size=(6,4)), columns =list('ABCD'))