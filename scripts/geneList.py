#!/usr/bin/env python3


# Function of script: Takes in list of genes (.txt file with only one column) and csv containing variants. Returns positions of variants in csv file that match one of the gene names.

""" Code written by Shannon Ormond 2018. Contact email: s.ormond@massey.ac.nz """


# loads varAft annotation file and adds extra columns to be annotated

def loadf(file) :

    df = pd.read_csv(file, sep = ",")

    ndf = df.loc[:, ["Gene.refgene", "Gene.ensgene", "X"]]

    return ndf



def loadgenelist(file) :

    text_file = open(file, "r")

    list = text_file.read().split('\n')

    return list



def compare(df, list) :

    newlist = []

    for line in range(0, len(df)) :

        refgene = df.loc[line, "Gene.refgene"]

        ensembl = df.loc[line, "Gene.ensgene"]

        for element in range(0, len(list)) :

            newelement = None
            
            if list[element] == refgene :

                newelement = ((list[element]) + "," + str(( df.loc[line, "X"])))

            elif list[element] == ensembl :

                newelement = ((list[element]) + "," + str(( df.loc[line, "X"])))

            if newelement != None :
            
                newlist.append(newelement)
    
    return(newlist)



def writeoutlist(list, filename):

    with open(filename, "w") as outfile:

        for entries in list:

            outfile.write(entries)

            outfile.write("\n")



# required package stuff

import pandas as pd

import sys

import argparse

import re

import numpy as np



# command line stuff

parser = argparse.ArgumentParser()

parser.add_argument('-c', '--csv', help = "Required argument. File for sample 1.")

parser.add_argument('-g', '--genelist', help = "Required argument. File for sample 2.")

parser.add_argument('-d', '--datafile', help = "Optional argument. Stem name for output csv file must be specified.")

args = parser.parse_args()



csv = loadf(args.csv)

genelist = loadgenelist(args.genelist)

newlist = compare(csv, genelist)

writeoutlist(newlist, args.datafile)
