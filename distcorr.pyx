#!/usr/bin/env Python3 
"""
Author: Ian Coleman
Purpose: Distance Correlation matrix and graphic for Pandas

TODO:
change dist_corr to a self method
change subset_of to length of df
add graphic element 
replace the dcor package with the actual formula and code
"""


import dcor
import pandas as pd
from sys import argv
import seaborn as sns

# Dcor
cpdef dist_corr (df, graph=None):
	matrix = dist_corr_matrix(df)
	print(matrix)
	if graph is not None:
		matrix_heatmap(matrix)


cpdef dist_corr_matrix (df, subset_of = False):
	matrix = pd.DataFrame(index = df.columns, columns = df.columns)
	rows = df.shape[0]
	cols = df.shape[1]

	if rows > 2000:
		df = df.sample(2000)

	if cols > 2000:
		df = df.sample(2000, axis = 1)

	cdef int no_rows = df.shape[0]
	cdef int no_cols = df.shape[1]
	cdef int x, y

	for x in range(0,no_cols):
		for y in range(0,no_cols):
			matrix.iloc[y,x] = dcor.distance_correlation(df.iloc[0:no_rows, x], df.iloc[0:no_rows, y])

	return matrix


def matrix_heatmap (matrix):
	# Convert all to floats for SNS processing
	matrix = matrix.transform(lambda x: x.astype('float64'))
	print('Attempting graph --> assuming Pandas in Jupyter')
	print(sns.heatmap(matrix))  


	# Convert all to floats for SNS processing
	# matrix = matrix.transform(lambda x: x.astype('float64'))
	# print(sns.heatmap(matrix))    
	    

# # Create df framework for dcor results
# matrix = pd.DataFrame(index=df.columns, columns = df.columns)

# # Iterate through column pairings and calculate dcor, adding to df
# for x in df.columns:
#     for y in df.columns:
#         matrix.loc[y,x] = dcor.distance_correlation(df.loc[1:2000, x], df.loc[1:2000, y])

# # Convert all to floats for SNS processing
# matrix = matrix.transform(lambda x: x.astype('float64'))
# print(sns.heatmap(matrix))    
    
# matrix