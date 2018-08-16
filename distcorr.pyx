#!/usr/bin/env Python3 
"""
Author: Ian Coleman
Purpose: Distance Correlation matrix and graphic for Pandas

TODO:
change dist_corr to a self method
change subset_of to length of df
add graphic element 
"""


import dcor
import pandas as pd
from sys import argv

# Dcor
cpdef dist_corr (df):
	matrix = dist_corr_matrix(df)
	# print(matrix)

cpdef dist_corr_matrix (df, subset_of = False):
	matrix = pd.DataFrame(index = df.columns, columns = df.columns)
	cdef int no_rows = df.shape[0]

	cdef unicode x, y

	for x in df.columns:
		for y in df.columns:
			matrix.loc[y,x] = dcor.distance_correlation(df.loc[0:no_rows, x], df.loc[0:no_rows, y])

	return matrix



	# Convert all to floats for SNS processing
	# dist_corrs = dist_corrs.transform(lambda x: x.astype('float64'))
	# print(sns.heatmap(dist_corrs))    
	    

# # Create df framework for dcor results
# dist_corrs = pd.DataFrame(index=df.columns, columns = df.columns)

# # Iterate through column pairings and calculate dcor, adding to df
# for x in df.columns:
#     for y in df.columns:
#         dist_corrs.loc[y,x] = dcor.distance_correlation(df.loc[1:2000, x], df.loc[1:2000, y])

# # Convert all to floats for SNS processing
# dist_corrs = dist_corrs.transform(lambda x: x.astype('float64'))
# print(sns.heatmap(dist_corrs))    
    
# dist_corrs